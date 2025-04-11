module one_hot(
    input w,
    input clk,
    input rs,
    output z,
    output [4:0] state
);

    wire Anext, Bnext, Cnext, Dnext, Enext;
    // wire Astate, Bstate, Cstate, Dstate, Estate;
    
    dff Adff(
        .Default(1'b1),
        .D(Anext),
        .clk(clk),
        .reset(rs),
        .Q(state[0])
    );
    
    dff Bdff(
        .Default(1'b0),
        .D(Bnext),
        .clk(clk),
        .reset(rs),
        .Q(state[1])
    );
    
    dff Cdff(
        .Default(1'b0),
        .D(Cnext),
        .clk(clk),
        .reset(rs),
        .Q(state[2])
    );
    
    dff Ddff(
        .Default(1'b0),
        .D(Dnext),
        .clk(clk),
        .reset(rs),
        .Q(state[3])
    );
    
    dff Edff(
        .Default(1'b0),
        .D(Enext),
        .clk(clk),
        .reset(rs),
        .Q(state[4])
    );
    
    assign z = state[2] | state[4];
    
    assign Anext = 1'b0;
    assign Bnext = (~w & state[0]) | (~w & state[3]) | (~w & state[4]);
    assign Cnext = (~w & state[1]) | (~w & state[2]);
    assign Dnext = (w & state[0]) | (w & state[1]) | (w & state[2]);
    assign Enext = (w & state[3]) | (w & state[4]);
    
    
endmodule