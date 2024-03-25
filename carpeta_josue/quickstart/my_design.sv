module my_design #(
    parameter DATA_WIDTH = 8  // Define el ancho de datos como un parámetro, para facilitar cambios futuros
)(
    input logic clk,          // 'logic' puede ser usado en lugar de 'wire' para señales que serán conducidas por procedimientos continuos y procedimentales
    input logic reset,
    input logic a_enable, r_enable, b_enable,
    input logic [DATA_WIDTH-1:0] i_TDATA,
    input logic [DATA_WIDTH-1:0] k_TDATA,
    input logic [DATA_WIDTH-1:0] b_TDATA,
    output logic [DATA_WIDTH-1:0] o_TDATA
);

    logic [DATA_WIDTH-1:0] c, a;
    logic [DATA_WIDTH-1:0] b, salida;

    always_ff @(posedge clk or negedge reset) begin
        if (!reset) a <= 0;
        else if (r_enable) a <= salida;
    end
            
    always_ff @(posedge clk or negedge reset) begin
        if (!reset) o_TDATA <= 0;
        else if (a_enable) o_TDATA <= b;
    end
    
    assign salida = i_TDATA * k_TDATA; // Multiplicación de los datos de entrada
    assign b = a + c;                  // Suma de 'a' y 'c'

    // Este bloque maneja la actualización de 'c' basado en 'b_enable'
    always_comb begin
        case (b_enable)
            1'b0: c = o_TDATA;
            1'b1: c = b_TDATA;
        endcase
    end

endmodule
