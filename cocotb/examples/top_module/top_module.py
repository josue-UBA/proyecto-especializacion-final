

class TopModule:
    def __init__(self) -> None:
        self.o_TREADY =  0
        self.o_TVALID =  0
        self.o_TDATA =  0
        self.i_TREADY =  0
        self.k_TREADY =  0
        self.b_TREADY =  0
    
    def do_something(    
        srst_i,
        enable_i,
        new_i,
        i_TDATA,
        k_TDATA,
        b_TDATA,
    ):
        return 0

topModule = TopModule()