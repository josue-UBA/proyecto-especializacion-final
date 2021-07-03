module top(
    input wire clk,
    output reg [1:0] led,
    input wire [1:0] sw
    );

    always @ (posedge clk)
    begin
        if(sw[0] == 0)
        begin
            led[0] <= 1'b0;
        end
        else
        begin
            led[0] <= 1'b1;
        end
    end
endmodule
