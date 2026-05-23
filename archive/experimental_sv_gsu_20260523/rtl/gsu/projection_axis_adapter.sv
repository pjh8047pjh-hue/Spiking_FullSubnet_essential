`timescale 1 ns / 1 ps

import gsu_q610_pkg::*;

// D-1: HLS top의 USE_PROJECTION_EXTERNAL AXIS 프로토콜과
// projection_dot_scalar_bb의 wire 인터페이스를 변환하는 어댑터.
//
// 프로토콜:
//   - s_axis_req: 16-bit/word AXIS slave, 448 word 수신
//       word 0..223   : input vector (lane-sequential, tile=word/32, lane=word%32)
//       word 224..447 : proj_row     (동일 매핑, 마지막 word에 tlast=1)
//   - 448 word 모두 수신 후 projection_dot_scalar 인스턴스에 ap_start=1
//   - ap_done 대기 → sum_q20[47:0]을 16-bit 3 word로 분할 송출
//   - m_axis_resp: 16-bit/word AXIS master, 3 word (lo/mid/hi, 마지막에 tlast=1)
//
// projection IP는 본 모듈 내부에 인스턴스화하여 어댑터 IP 하나로 합성.
module projection_axis_adapter (
    input  wire         ap_clk,
    input  wire         ap_rst,

    input  wire [15:0]  s_axis_req_tdata,
    input  wire         s_axis_req_tvalid,
    output reg          s_axis_req_tready,
    input  wire         s_axis_req_tlast,

    output reg  [15:0]  m_axis_resp_tdata,
    output reg          m_axis_resp_tvalid,
    input  wire         m_axis_resp_tready,
    output reg          m_axis_resp_tlast
);
  localparam int HIDDEN_TILES = 7;
  localparam int TILE_LANES   = 32;
  localparam int INPUT_WORDS  = HIDDEN_TILES * TILE_LANES;   // 224
  localparam int PROJ_WORDS   = HIDDEN_TILES * TILE_LANES;   // 224

  typedef enum logic [3:0] {
    ST_IDLE,
    ST_RCV_INPUT,
    ST_RCV_PROJ,
    ST_LATCH,
    ST_WAIT_DONE,
    ST_SEND_LO,
    ST_SEND_MID,
    ST_SEND_HI,
    ST_CONTINUE
  } state_t;

  state_t      state;
  logic [7:0]  word_counter;
  logic [511:0] input_tiles_r [0:HIDDEN_TILES-1];
  logic [511:0] proj_tiles_r  [0:HIDDEN_TILES-1];

  logic        proj_ap_start;
  logic        proj_ap_continue;
  logic        proj_ap_done;
  logic        proj_ap_idle;
  logic        proj_ap_ready;
  logic [47:0] proj_sum_q20;
  logic        proj_sum_q20_ap_vld;
  logic [47:0] sum_q20_r;

  // 받은 word를 input_tile/proj_tile의 어느 자리에 쓸지
  wire [2:0] tile_idx = word_counter[7:5];   // 0..6
  wire [4:0] lane_idx = word_counter[4:0];   // 0..31
  wire       handshake_req = s_axis_req_tvalid && s_axis_req_tready;
  wire       handshake_resp = m_axis_resp_tvalid && m_axis_resp_tready;

  // projection_dot_scalar_bb 인스턴스 (B단계 packaging된 IP의 RTL을 직접 wrap)
  ProjectionDotProductPackedScalarSvQ610 u_projection (
      .ap_clk        (ap_clk),
      .ap_rst        (ap_rst),
      .ap_ce         (1'b1),
      .ap_start      (proj_ap_start),
      .ap_continue   (proj_ap_continue),
      .ap_done       (proj_ap_done),
      .ap_idle       (proj_ap_idle),
      .ap_ready      (proj_ap_ready),
      .input_tile_0  (input_tiles_r[0]),
      .input_tile_1  (input_tiles_r[1]),
      .input_tile_2  (input_tiles_r[2]),
      .input_tile_3  (input_tiles_r[3]),
      .input_tile_4  (input_tiles_r[4]),
      .input_tile_5  (input_tiles_r[5]),
      .input_tile_6  (input_tiles_r[6]),
      .proj_tile_0   (proj_tiles_r[0]),
      .proj_tile_1   (proj_tiles_r[1]),
      .proj_tile_2   (proj_tiles_r[2]),
      .proj_tile_3   (proj_tiles_r[3]),
      .proj_tile_4   (proj_tiles_r[4]),
      .proj_tile_5   (proj_tiles_r[5]),
      .proj_tile_6   (proj_tiles_r[6]),
      .sum_q20       (proj_sum_q20),
      .sum_q20_ap_vld(proj_sum_q20_ap_vld)
  );

  always_ff @(posedge ap_clk) begin
    if (ap_rst) begin
      state              <= ST_IDLE;
      word_counter       <= '0;
      s_axis_req_tready  <= 1'b0;
      m_axis_resp_tdata  <= '0;
      m_axis_resp_tvalid <= 1'b0;
      m_axis_resp_tlast  <= 1'b0;
      proj_ap_start      <= 1'b0;
      proj_ap_continue   <= 1'b0;
      sum_q20_r          <= '0;
      for (int i = 0; i < HIDDEN_TILES; i++) begin
        input_tiles_r[i] <= '0;
        proj_tiles_r[i]  <= '0;
      end
    end else begin
      // 기본값: pulse 신호는 1 cycle 후 자동 해제
      proj_ap_start    <= 1'b0;
      proj_ap_continue <= 1'b0;

      case (state)
        ST_IDLE: begin
          s_axis_req_tready  <= 1'b1;
          m_axis_resp_tvalid <= 1'b0;
          m_axis_resp_tlast  <= 1'b0;
          word_counter       <= '0;
          if (handshake_req) begin
            input_tiles_r[tile_idx][lane_idx*16 +: 16] <= s_axis_req_tdata;
            if (INPUT_WORDS == 1) begin
              word_counter <= '0;
              state        <= ST_RCV_PROJ;
            end else begin
              word_counter <= 8'd1;
              state        <= ST_RCV_INPUT;
            end
          end
        end

        ST_RCV_INPUT: begin
          if (handshake_req) begin
            input_tiles_r[tile_idx][lane_idx*16 +: 16] <= s_axis_req_tdata;
            if (word_counter == INPUT_WORDS - 1) begin
              word_counter <= '0;
              state        <= ST_RCV_PROJ;
            end else begin
              word_counter <= word_counter + 8'd1;
            end
          end
        end

        ST_RCV_PROJ: begin
          if (handshake_req) begin
            proj_tiles_r[tile_idx][lane_idx*16 +: 16] <= s_axis_req_tdata;
            if (word_counter == PROJ_WORDS - 1) begin
              word_counter      <= '0;
              s_axis_req_tready <= 1'b0;
              state             <= ST_LATCH;
            end else begin
              word_counter <= word_counter + 8'd1;
            end
          end
        end

        ST_LATCH: begin
          // 마지막 proj tile 쓰기가 register에 반영된 다음 사이클에 start
          proj_ap_start <= 1'b1;
          state         <= ST_WAIT_DONE;
        end

        ST_WAIT_DONE: begin
          if (proj_ap_done) begin
            sum_q20_r <= proj_sum_q20;
            state     <= ST_SEND_LO;
          end
        end

        ST_SEND_LO: begin
          m_axis_resp_tdata  <= sum_q20_r[15:0];
          m_axis_resp_tvalid <= 1'b1;
          m_axis_resp_tlast  <= 1'b0;
          if (handshake_resp) begin
            state <= ST_SEND_MID;
          end
        end

        ST_SEND_MID: begin
          m_axis_resp_tdata  <= sum_q20_r[31:16];
          m_axis_resp_tvalid <= 1'b1;
          m_axis_resp_tlast  <= 1'b0;
          if (handshake_resp) begin
            state <= ST_SEND_HI;
          end
        end

        ST_SEND_HI: begin
          m_axis_resp_tdata  <= sum_q20_r[47:32];
          m_axis_resp_tvalid <= 1'b1;
          m_axis_resp_tlast  <= 1'b1;
          if (handshake_resp) begin
            m_axis_resp_tvalid <= 1'b0;
            m_axis_resp_tlast  <= 1'b0;
            proj_ap_continue   <= 1'b1;
            state              <= ST_CONTINUE;
          end
        end

        ST_CONTINUE: begin
          // projection IP가 IDLE로 복귀할 시간 1 cycle 제공 후 다음 요청 받기
          state <= ST_IDLE;
        end

        default: state <= ST_IDLE;
      endcase
    end
  end
endmodule
