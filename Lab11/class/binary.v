module binary(
    input w,
    input clk,
    input rs,
    output z,
    output [2:0] state
);

    // wire[2:0] State;
    wire[2:0] Next;
    
    dff zero(
        .Default(1'b0),
        .D(Next[0]),
        .clk(clk),
        .reset(rs),
        .Q(state[0])
    );
    
    dff one(
        .Default(1'b0),
        .D(Next[1]),
        .clk(clk),
        .reset(rs),
        .Q(state[1])
    );
    
    dff two(
        .Default(1'b0),
        .D(Next[2]),
        .clk(clk),
        .reset(rs),
        .Q(state[2])
    );
    
    assign z = (~state[2] & state[1] & ~state[0]) | (state[2] & ~state[1] & ~state[0]);
    assign Next[0] = (~state[2] & ~state[1] & ~state[0]) 
                        | (w & ~state[2] & ~state[1] & state[0]) 
                        | (w & ~state[2] & state[1] & ~state[0]) 
                        | (~w & ~state[2] & state[1] & state[0]) 
                        | (~w & state[2] & ~state[1] & ~state[0]);
    assign Next[1] = (w & ~state[2] & ~state[1] & ~state[0])
                        | (~state[2] & ~state[1] & state[0]) 
                        | (~state[2] & state[1] & ~state[0]);
    assign Next[2] = (w & ~state[2] & state[1] & state[0]) 
                        | (w & state[2] & ~state[1] & ~state[0]);
    
    
endmodule