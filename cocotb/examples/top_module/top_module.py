
from ..accumulator.accumulator import accumulator
from ..control_unit.control_unit import controlUnit

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
        controlUnit.transition(i_TVALID,k_TVALID,b_TVALID)
        accumulator.accumulate()
        
        return 0

topModule = TopModule()