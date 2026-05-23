`timescale 1 ns / 1 ps

module learning_counter #(
    parameter int WIDTH = 8,
    parameter int MAX_VALUE = (1 << WIDTH) - 1
) (
    input  logic             clk,
    input  logic             rst_n,
    input  logic             clear,
    input  logic             enable,
    output logic [WIDTH-1:0] count,
    output logic             wrap
);
  always_ff @(posedge clk) begin
    if (!rst_n) begin
      count <= '0;
      wrap <= 1'b0;
    end else begin
      wrap <= 1'b0;
      if (clear) begin
        count <= '0;
      end else if (enable) begin
        if (count == WIDTH'(MAX_VALUE)) begin
          count <= '0;
          wrap <= 1'b1;
        end else begin
          count <= count + WIDTH'(1);
        end
      end
    end
  end
endmodule

module learning_single_port_ram #(
    parameter int DATA_WIDTH = 16,
    parameter int ADDR_WIDTH = 8
) (
    input  logic                  clk,
    input  logic                  en,
    input  logic                  we,
    input  logic [ADDR_WIDTH-1:0] addr,
    input  logic [DATA_WIDTH-1:0] wdata,
    output logic [DATA_WIDTH-1:0] rdata
);
  logic [DATA_WIDTH-1:0] mem [0:(1 << ADDR_WIDTH)-1];

  always_ff @(posedge clk) begin
    if (en) begin
      if (we) begin
        mem[addr] <= wdata;
      end
      rdata <= mem[addr];
    end
  end
endmodule

module learning_sync_fifo #(
    parameter int DATA_WIDTH = 16,
    parameter int DEPTH = 8,
    parameter int ADDR_WIDTH = $clog2(DEPTH)
) (
    input  logic                  clk,
    input  logic                  rst_n,
    input  logic                  wr_valid,
    output logic                  wr_ready,
    input  logic [DATA_WIDTH-1:0] wr_data,
    input  logic                  wr_last,
    output logic                  rd_valid,
    input  logic                  rd_ready,
    output logic [DATA_WIDTH-1:0] rd_data,
    output logic                  rd_last,
    output logic [ADDR_WIDTH:0]   level
);
  logic [DATA_WIDTH:0] mem [0:DEPTH-1];
  logic [ADDR_WIDTH-1:0] wr_ptr;
  logic [ADDR_WIDTH-1:0] rd_ptr;
  logic push;
  logic pop;

  assign wr_ready = (level < (ADDR_WIDTH + 1)'(DEPTH));
  assign rd_valid = (level != '0);
  assign {rd_last, rd_data} = mem[rd_ptr];
  assign push = wr_valid && wr_ready;
  assign pop = rd_valid && rd_ready;

  function automatic logic [ADDR_WIDTH-1:0] next_ptr(input logic [ADDR_WIDTH-1:0] ptr);
    if (ptr == ADDR_WIDTH'(DEPTH - 1)) begin
      return '0;
    end
    return ptr + ADDR_WIDTH'(1);
  endfunction

  always_ff @(posedge clk) begin
    if (!rst_n) begin
      wr_ptr <= '0;
      rd_ptr <= '0;
      level <= '0;
    end else begin
      if (push) begin
        mem[wr_ptr] <= {wr_last, wr_data};
        wr_ptr <= next_ptr(wr_ptr);
      end

      if (pop) begin
        rd_ptr <= next_ptr(rd_ptr);
      end

      unique case ({push, pop})
        2'b10: level <= level + (ADDR_WIDTH + 1)'(1);
        2'b01: level <= level - (ADDR_WIDTH + 1)'(1);
        default: level <= level;
      endcase
    end
  end
endmodule

module learning_axis_skid_buffer #(
    parameter int DATA_WIDTH = 16
) (
    input  logic                  clk,
    input  logic                  rst_n,
    input  logic                  s_valid,
    output logic                  s_ready,
    input  logic [DATA_WIDTH-1:0] s_data,
    input  logic                  s_last,
    output logic                  m_valid,
    input  logic                  m_ready,
    output logic [DATA_WIDTH-1:0] m_data,
    output logic                  m_last
);
  logic                  out_valid;
  logic [DATA_WIDTH-1:0] out_data;
  logic                  out_last;
  logic                  buf_valid;
  logic [DATA_WIDTH-1:0] buf_data;
  logic                  buf_last;
  logic                  in_fire;
  logic                  out_fire;

  assign s_ready = !buf_valid;
  assign m_valid = out_valid;
  assign m_data = out_data;
  assign m_last = out_last;
  assign in_fire = s_valid && s_ready;
  assign out_fire = m_valid && m_ready;

  always_ff @(posedge clk) begin
    if (!rst_n) begin
      out_valid <= 1'b0;
      out_data <= '0;
      out_last <= 1'b0;
      buf_valid <= 1'b0;
      buf_data <= '0;
      buf_last <= 1'b0;
    end else begin
      if (out_fire) begin
        if (buf_valid) begin
          out_valid <= 1'b1;
          out_data <= buf_data;
          out_last <= buf_last;
          buf_valid <= 1'b0;
        end else if (in_fire) begin
          out_valid <= 1'b1;
          out_data <= s_data;
          out_last <= s_last;
        end else begin
          out_valid <= 1'b0;
        end
      end else begin
        if (!out_valid && in_fire) begin
          out_valid <= 1'b1;
          out_data <= s_data;
          out_last <= s_last;
        end else if (out_valid && in_fire) begin
          buf_valid <= 1'b1;
          buf_data <= s_data;
          buf_last <= s_last;
        end
      end
    end
  end
endmodule

module learning_simple_mac_fsm #(
    parameter int DATA_WIDTH = 16,
    parameter int ACC_WIDTH = 40,
    parameter int LENGTH = 8,
    parameter int COUNT_WIDTH = $clog2(LENGTH + 1)
) (
    input  logic                         clk,
    input  logic                         rst_n,
    input  logic                         start,
    output logic                         busy,
    output logic                         done,
    input  logic                         sample_valid,
    output logic                         sample_ready,
    input  logic signed [DATA_WIDTH-1:0] sample_data,
    input  logic signed [DATA_WIDTH-1:0] coeff_data,
    output logic signed [ACC_WIDTH-1:0]  result
);
  localparam int PRODUCT_WIDTH = 2 * DATA_WIDTH;

  logic [COUNT_WIDTH-1:0] index;
  logic signed [ACC_WIDTH-1:0] acc;
  logic signed [PRODUCT_WIDTH-1:0] product;
  logic signed [ACC_WIDTH-1:0] product_ext;
  logic signed [ACC_WIDTH-1:0] acc_next;

  assign sample_ready = busy;
  assign product = sample_data * coeff_data;
  assign product_ext = {{(ACC_WIDTH - PRODUCT_WIDTH){product[PRODUCT_WIDTH-1]}}, product};
  assign acc_next = acc + product_ext;

  always_ff @(posedge clk) begin
    if (!rst_n) begin
      busy <= 1'b0;
      done <= 1'b0;
      index <= '0;
      acc <= '0;
      result <= '0;
    end else begin
      done <= 1'b0;
      if (start && !busy) begin
        busy <= 1'b1;
        index <= '0;
        acc <= '0;
      end else if (busy && sample_valid && sample_ready) begin
        if (index == COUNT_WIDTH'(LENGTH - 1)) begin
          result <= acc_next;
          busy <= 1'b0;
          done <= 1'b1;
        end else begin
          acc <= acc_next;
          index <= index + COUNT_WIDTH'(1);
        end
      end
    end
  end
endmodule
