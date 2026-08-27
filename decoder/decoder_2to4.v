`timescale 1ns/1ps

module decoder_2to4 (
    input A,
    input B,
    input Enable,
    output reg [3:0] Y
);

always @(*) begin

    if (Enable == 1'b0)
        Y = 4'b0000;

    else begin
        case ({A, B})

            2'b00: Y = 4'b0001;
            2'b01: Y = 4'b0010;
            2'b10: Y = 4'b0100;
            2'b11: Y = 4'b1000;

            default: Y = 4'b0000;

        endcase
    end

end

endmodule