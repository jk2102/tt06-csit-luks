/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`define default_netname none

module tt_um_csit_luks (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.
  assign uo_out[7:4]  = 4'b1010;  // Example: ou_out is the sum of ui_in and uio_in
  assign uio_out = 0;
  assign uio_oe  = 0;

  // Rotational encoder
  rotational_encoder rotational_encoder_instance (
    .clk          (clk),          // Clock input
    .rstn         (rst_n),         // Active low reset input
    .A            (ui_in[0]),            // Encoder input A
    .B            (ui_in[1]),            // Encoder input B
    .PB           (ui_in[2]),           // Pushbutton
    .enc_counter  (uo_out[3:0]),  // 4-bit encoder counter
    .pb_cnt       ()        // 12-bit pushbutton counter
);


endmodule
