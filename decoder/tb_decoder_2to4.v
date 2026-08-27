`timescale 1ns/1ps

module tb_decoder_2to4;

reg A;
reg B;
reg Enable;

wire [3:0] Y;

// Instantiate the decoder
decoder_2to4 uut (
    .A(A),
    .B(B),
    .Enable(Enable),
    .Y(Y)
);

// Generate waveform
initial begin
    $dumpfile("decoder_2to4.vcd");
    $dumpvars(0, tb_decoder_2to4);
end

// Test all input combinations
initial begin

    $display("Time\tEnable\tA\tB\tY");

    $monitor("%0t\t%b\t%b\t%b\t%b",
             $time, Enable, A, B, Y);

    // Decoder disabled
    Enable = 0;
    A = 0;
    B = 0;
    #10;

    // Enable decoder
    Enable = 1;

    // Input 00
    A = 0;
    B = 0;
    #10;

    // Input 01
    A = 0;
    B = 1;
    #10;

    // Input 10
    A = 1;
    B = 0;
    #10;

    // Input 11
    A = 1;
    B = 1;
    #10;

    $finish;

end

endmodule