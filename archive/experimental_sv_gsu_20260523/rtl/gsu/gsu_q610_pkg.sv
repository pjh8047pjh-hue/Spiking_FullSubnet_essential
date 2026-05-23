`timescale 1 ns / 1 ps

package gsu_q610_pkg;
  typedef logic signed [15:0] q_t;
  typedef logic signed [47:0] acc_t;

  localparam int Q_FRAC = 10;
  localparam int Q_ZERO = 0;
  localparam int Q_ONE = 1 << Q_FRAC;
  localparam int SIGMOID_SEGMENTS = 16;

  function automatic q_t saturate_int16(input acc_t value);
    if (value > 48'sd32767) begin
      return q_t'(16'sd32767);
    end
    if (value < -48'sd32768) begin
      return q_t'(-16'sd32768);
    end
    return q_t'(value[15:0]);
  endfunction

  function automatic acc_t round_shift_right(input acc_t value, input int shift_bits);
    acc_t half;
    acc_t magnitude;
    begin
      if (shift_bits <= 0) begin
        return value;
      end
      half = acc_t'(48'sd1 <<< (shift_bits - 1));
      if (value >= 0) begin
        return (value + half) >>> shift_bits;
      end
      magnitude = -value;
      return -((magnitude + half) >>> shift_bits);
    end
  endfunction

  function automatic q_t add_q610(input q_t lhs, input q_t rhs);
    return saturate_int16(acc_t'(lhs) + acc_t'(rhs));
  endfunction

  function automatic q_t sub_q610(input q_t lhs, input q_t rhs);
    return saturate_int16(acc_t'(lhs) - acc_t'(rhs));
  endfunction

  function automatic acc_t mul_for_mac_q610(input q_t lhs, input q_t rhs);
    return acc_t'(lhs) * acc_t'(rhs);
  endfunction

  function automatic q_t mul_q610(input q_t lhs, input q_t rhs);
    acc_t product_q20;
    begin
      product_q20 = acc_t'(lhs) * acc_t'(rhs);
      return saturate_int16(round_shift_right(product_q20, Q_FRAC));
    end
  endfunction

  function automatic q_t step_activation_q610(input q_t input_value);
    return (input_value >= 0) ? q_t'(Q_ONE) : q_t'(Q_ZERO);
  endfunction

  function automatic int sigmoid_knot(input int index);
    case (index)
      0: return 0;
      1: return 256;
      2: return 512;
      3: return 768;
      4: return 1024;
      5: return 1280;
      6: return 1536;
      7: return 1792;
      8: return 2048;
      9: return 2560;
      10: return 3072;
      11: return 3584;
      12: return 4096;
      13: return 5120;
      14: return 6144;
      15: return 7168;
      default: return 8192;
    endcase
  endfunction

  function automatic int sigmoid_value(input int index);
    case (index)
      0: return 512;
      1: return 576;
      2: return 637;
      3: return 695;
      4: return 749;
      5: return 796;
      6: return 837;
      7: return 872;
      8: return 902;
      9: return 946;
      10: return 975;
      11: return 994;
      12: return 1006;
      13: return 1017;
      14: return 1021;
      15: return 1023;
      default: return 1024;
    endcase
  endfunction

  function automatic q_t sigmoid_pwl_q610(input q_t input_value_q610);
    bit is_negative;
    int abs_input_int;
    int segment_index;
    int x0_q610;
    int y0_q610;
    int y1_q610;
    int shift_bits;
    int delta_y_q610;
    int offset_x_q610;
    int interp_product_q610;
    int interpolated_q610;
    q_t positive_value_q610;
    begin
      if (input_value_q610 >= q_t'(sigmoid_knot(SIGMOID_SEGMENTS))) begin
        return q_t'(Q_ONE);
      end
      if (input_value_q610 <= q_t'(-sigmoid_knot(SIGMOID_SEGMENTS))) begin
        return q_t'(Q_ZERO);
      end

      is_negative = input_value_q610 < 0;
      abs_input_int = is_negative ? -int'(input_value_q610) : int'(input_value_q610);

      if (abs_input_int <= 256) begin
        segment_index = 0;
      end else if (abs_input_int <= 2048) begin
        segment_index = (abs_input_int - 1) >>> 8;
      end else if (abs_input_int <= 4096) begin
        segment_index = 8 + ((abs_input_int - 2049) >>> 9);
      end else begin
        segment_index = 12 + ((abs_input_int - 4097) >>> 10);
      end

      x0_q610 = sigmoid_knot(segment_index);
      y0_q610 = sigmoid_value(segment_index);
      y1_q610 = sigmoid_value(segment_index + 1);
      shift_bits = (segment_index < 8) ? 8 : ((segment_index < 12) ? 9 : 10);
      delta_y_q610 = y1_q610 - y0_q610;
      offset_x_q610 = abs_input_int - x0_q610;
      interp_product_q610 = offset_x_q610 * delta_y_q610;
      interpolated_q610 = y0_q610 + ((interp_product_q610 + (1 <<< (shift_bits - 1))) >>> shift_bits);
      positive_value_q610 = saturate_int16(acc_t'(interpolated_q610));
      return is_negative ? sub_q610(q_t'(Q_ONE), positive_value_q610) : positive_value_q610;
    end
  endfunction
endpackage
