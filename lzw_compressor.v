module lzw_compressor (
  input clk,
  input rst,
  input [7:0] data_in,
  input valid,
  output reg [7:0] compressed_data,
  output reg done
);

  // FSM States
  parameter IDLE = 2'b00;
  parameter LOAD = 2'b01;
  parameter PROCESS = 2'b10;
  parameter FINISH = 2'b11;

  reg [1:0] current_state;
  reg [1:0] next_state;
  reg [7:0] buffer;

  // FSM State Register
  always @(posedge clk or posedge rst) begin
    if (rst)
      current_state <= IDLE;
    else
      current_state <= next_state;
  end

  // FSM Transition Logic
  always @(*) begin
    case (current_state)
      IDLE:    next_state = valid ? LOAD : IDLE;
      LOAD:    next_state = PROCESS;
      PROCESS: next_state = FINISH;
      FINISH:  next_state = IDLE;
      default: next_state = IDLE;
    endcase
  end

  // FSM Output Logic
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      compressed_data <= 8'd0;
      done <= 1'b0;
      buffer <= 8'd0;
    end else begin
      case (current_state)
        IDLE: begin
          done <= 1'b0;
        end
        LOAD: begin
          buffer <= data_in;
        end
        PROCESS: begin
          compressed_data <= (buffer ^ 8'h3C) + 8'h05;
        end
        FINISH: begin
          done <= 1'b1;
        end
      endcase
    end
  end

endmodule

