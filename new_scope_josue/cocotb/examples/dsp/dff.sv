`include "DSP48E1.v"
`include "glbl.v"

module dff (
    input  logic clk,
    input  logic rst,
    input  logic [17:0] a,
    input  logic [17:0] b,
    output logic [47:0] y
);

    logic [47:0] acc;
    wire [47:0] result;

    DSP48E1 #(
        .ACASCREG(1),
        .AREG(1),
        .BCASCREG(1),
        .BREG(1),
        .CARRYINREG(1),
        .CREG(1),
        .DREG(1),
        .MREG(1),
        .OPMODEREG(1),
        .PREG(1)
    ) dsp48e1_inst (
        .A({12'b0, a}),
        .B(b),
        .C(48'b0),
        .D(25'b0),
        .P(result),
        .CLK(clk),
        .RSTA(rst),
        .ACOUT(),
        .BCOUT(),
        .PCOUT(),
        .CARRYOUT(),
        .CARRYIN(1'b0),
        .CARRYINSEL(3'b0),
        .OPMODE(7'b0110101), // Multiplicación
        .ALUMODE(4'b0000),
        .CEA1(1'b1),
        .CEA2(1'b1),
        .CEB1(1'b1),
        .CEB2(1'b1),
        .CEC(1'b1),
        .CED(1'b1),
        .CEP(1'b1),
        .CEALUMODE(1'b1),
        .CECTRL(1'b1),
        .RSTB(rst),
        .RSTC(rst),
        .RSTD(rst),
        .RSTP(rst),
        .RSTCTRL(rst),
        .RSTALUMODE(rst)
    );

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            acc <= 0;
        end else begin
            acc <= acc + result;
        end
    end

    assign y = acc;
endmodule
