module calculadora_sincrona(
    input [7:0] entrada,
    input [2:0] codigo,
    output reg [7:0] saida,   
    input clk,
    input rst               
);
    
    reg [7:0] acumulador;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            acumulador <= 8'b0;
            saida <= 8'b0;
        end
        else begin
            case (codigo)
                3'b000: begin  // Mostrar Entrada
                    saida <= entrada;
                end
                3'b001: begin  // Somar
                    acumulador <= acumulador + entrada;
                    saida <= 8'b0;
                end
                3'b010: begin  // Subtrair
                    acumulador <= acumulador - entrada;
                    saida <= 8'b0;
                end
                3'b011: begin  // Mostrar Acumulador
                    saida <= acumulador;
                end
                default: begin  // Default case
                    saida <= saida;
                    acumulador <= acumulador;
                end
            endcase
        end
    end
endmodule