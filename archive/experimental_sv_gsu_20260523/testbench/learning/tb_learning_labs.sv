`timescale 1 ns / 1 ps

module tb_learning_labs;
  localparam int SKID_WORDS = 128;
  localparam int MAC_LENGTH = 8;

  logic clk = 1'b0;
  logic rst_n = 1'b0;
  int errors = 0;

  logic counter_clear;
  logic counter_enable;
  logic [3:0] counter_count;
  logic counter_wrap;

  logic skid_s_valid;
  logic skid_s_ready;
  logic [15:0] skid_s_data;
  logic skid_s_last;
  logic skid_m_valid;
  logic skid_m_ready;
  logic [15:0] skid_m_data;
  logic skid_m_last;

  logic mac_start;
  logic mac_busy;
  logic mac_done;
  logic mac_sample_valid;
  logic mac_sample_ready;
  logic signed [15:0] mac_sample_data;
  logic signed [15:0] mac_coeff_data;
  logic signed [39:0] mac_result;

  always #5 clk = ~clk;

  learning_counter #(
      .WIDTH(4),
      .MAX_VALUE(9)
  ) counter_dut (
      .clk(clk),
      .rst_n(rst_n),
      .clear(counter_clear),
      .enable(counter_enable),
      .count(counter_count),
      .wrap(counter_wrap)
  );

  learning_axis_skid_buffer #(
      .DATA_WIDTH(16)
  ) skid_dut (
      .clk(clk),
      .rst_n(rst_n),
      .s_valid(skid_s_valid),
      .s_ready(skid_s_ready),
      .s_data(skid_s_data),
      .s_last(skid_s_last),
      .m_valid(skid_m_valid),
      .m_ready(skid_m_ready),
      .m_data(skid_m_data),
      .m_last(skid_m_last)
  );

  learning_simple_mac_fsm #(
      .DATA_WIDTH(16),
      .ACC_WIDTH(40),
      .LENGTH(MAC_LENGTH)
  ) mac_dut (
      .clk(clk),
      .rst_n(rst_n),
      .start(mac_start),
      .busy(mac_busy),
      .done(mac_done),
      .sample_valid(mac_sample_valid),
      .sample_ready(mac_sample_ready),
      .sample_data(mac_sample_data),
      .coeff_data(mac_coeff_data),
      .result(mac_result)
  );

  task automatic check(input bit condition, input string message);
    if (!condition) begin
      errors++;
      $display("CHECK FAILED: %s", message);
    end
  endtask

  task automatic reset_all;
    begin
      counter_clear = 1'b0;
      counter_enable = 1'b0;
      skid_s_valid = 1'b0;
      skid_s_data = '0;
      skid_s_last = 1'b0;
      skid_m_ready = 1'b0;
      mac_start = 1'b0;
      mac_sample_valid = 1'b0;
      mac_sample_data = '0;
      mac_coeff_data = '0;
      rst_n = 1'b0;
      repeat (5) @(posedge clk);
      rst_n = 1'b1;
      repeat (2) @(posedge clk);
    end
  endtask

  task automatic test_counter;
    int wrap_count;
    begin
      $display("TEST counter");
      wrap_count = 0;
      @(negedge clk);
      counter_clear = 1'b1;
      counter_enable = 1'b0;
      @(negedge clk);
      counter_clear = 1'b0;
      counter_enable = 1'b1;

      repeat (25) begin
        @(posedge clk);
        if (counter_wrap) begin
          wrap_count++;
        end
      end

      counter_enable = 1'b0;
      check(wrap_count == 2, "counter should wrap twice in 25 enabled cycles with max=9");
    end
  endtask

  task automatic test_skid_buffer_random_ready;
    int send_index;
    int recv_index;
    bit workers_done;
    int unsigned ready_state;
    begin
      $display("TEST AXIS skid buffer with random ready stalls");
      send_index = 0;
      recv_index = 0;
      workers_done = 1'b0;
      ready_state = 32'h1234abcd;

      skid_s_valid = 1'b0;
      skid_s_data = '0;
      skid_s_last = 1'b0;
      skid_m_ready = 1'b0;

      fork
        begin : workers
          fork
            begin : producer
              while (send_index < SKID_WORDS) begin
                @(negedge clk);
                skid_s_valid = 1'b1;
                skid_s_data = send_index[15:0];
                skid_s_last = (send_index == SKID_WORDS - 1);
                @(posedge clk);
                if (skid_s_valid && skid_s_ready) begin
                  send_index++;
                end
              end
              @(negedge clk);
              skid_s_valid = 1'b0;
              skid_s_last = 1'b0;
            end

            begin : consumer
              while (recv_index < SKID_WORDS) begin
                @(negedge clk);
                ready_state = (ready_state * 32'h0019660d) + 32'h3c6ef35f;
                skid_m_ready = (ready_state[3:0] != 4'h0);
                @(posedge clk);
                if (skid_m_valid && skid_m_ready) begin
                  if (skid_m_data !== recv_index[15:0]) begin
                    errors++;
                    $display("SKID DATA MISMATCH index=%0d actual=%0d", recv_index, skid_m_data);
                  end
                  if (skid_m_last !== (recv_index == SKID_WORDS - 1)) begin
                    errors++;
                    $display("SKID TLAST MISMATCH index=%0d actual=%0b", recv_index, skid_m_last);
                  end
                  recv_index++;
                end
              end
              @(negedge clk);
              skid_m_ready = 1'b0;
            end
          join
          workers_done = 1'b1;
        end

        begin : watchdog
          repeat (2000) @(posedge clk);
          if (!workers_done) begin
            errors++;
            $fatal(1, "skid buffer randomized test timed out");
          end
        end
      join_any
      disable fork;

      check(send_index == SKID_WORDS, "skid producer should send all words");
      check(recv_index == SKID_WORDS, "skid consumer should receive all words");
    end
  endtask

  task automatic test_mac_fsm_with_input_stalls;
    int i;
    int signed expected;
    int unsigned valid_state;
    logic signed [15:0] sample_values [0:MAC_LENGTH-1];
    logic signed [15:0] coeff_values [0:MAC_LENGTH-1];
    begin
      $display("TEST simple MAC FSM with input stalls");
      expected = 0;
      valid_state = 32'h31415926;
      for (i = 0; i < MAC_LENGTH; i++) begin
        sample_values[i] = 16'sd3 + i;
        coeff_values[i] = (i[0]) ? -16'sd2 : 16'sd5;
        expected += int'(sample_values[i]) * int'(coeff_values[i]);
      end

      @(negedge clk);
      mac_start = 1'b1;
      @(negedge clk);
      mac_start = 1'b0;

      for (i = 0; i < MAC_LENGTH; i++) begin
        do begin
          @(negedge clk);
          valid_state = (valid_state * 32'h0019660d) + 32'h3c6ef35f;
          mac_sample_valid = (valid_state[2:0] != 3'b000);
          mac_sample_data = sample_values[i];
          mac_coeff_data = coeff_values[i];
          @(posedge clk);
        end while (!(mac_sample_valid && mac_sample_ready));
        @(negedge clk);
        mac_sample_valid = 1'b0;
      end

      repeat (4) @(posedge clk);
      check(mac_done || !mac_busy, "MAC should complete after LENGTH accepted samples");
      check(mac_result == expected, "MAC result should match expected dot product");
    end
  endtask

  initial begin
    reset_all();
    test_counter();
    test_skid_buffer_random_ready();
    test_mac_fsm_with_input_stalls();

    if (errors == 0) begin
      $display("LEARNING_LABS_SUMMARY errors=0 result=PASS");
      $finish;
    end

    $display("LEARNING_LABS_SUMMARY errors=%0d result=FAIL", errors);
    $fatal(1, "learning labs failed");
  end
endmodule
