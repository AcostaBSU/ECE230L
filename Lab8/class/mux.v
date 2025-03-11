module mux (
    input [3:0] CEO, [3:0] self, [3:0] Fred, [3:0] Jill,
    input [1:0] SEL,
    input Enable,
    output [3:0] Data
);

    assign Data = (SEL == 'b00 ? CEO :
                    SEL == 'b01 ? self :
                    SEL == 'b10 ? Fred : Jill) & {4{Enable}};
    
endmodule