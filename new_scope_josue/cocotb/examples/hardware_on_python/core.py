from enum import Enum
from control_unit import controlUnit
from accumulator import accumulator

class Statetype(Enum):
    S0 = 0
    S1 = 1
    S2 = 2
    S3 = 3
    S4 = 4
    S5 = 5

class Core:
    def __init__(self) -> None:
        # output
        self.i_TREADY =  0
        self.k_TREADY =  0
        self.b_TREADY =  0
        self.o_TVALID =  0
        self.o_TDATA =  0

    
    def do_something(
        self,
        reset,
        enable_i,
        new_i,
        i_TVALID,
        k_TVALID,
        b_TVALID,
        o_TREADY,
        i_TDATA,
        k_TDATA,
        b_TDATA,
    ):
        
        controlUnit.clock(
            reset, 
            i_TVALID, 
            k_TVALID, 
            b_TVALID, 
            o_TREADY, 
            new_i)


        accumulator.clock(
            reset,
            controlUnit.r2_enable,
            controlUnit.r1_enable,
            controlUnit.m_enable,
            i_TDATA,
            k_TDATA,
            b_TDATA,
            )
        
        self.i_TREADY = controlUnit.i_TREADY
        self.k_TREADY = controlUnit.k_TREADY
        self.b_TREADY = controlUnit.b_TREADY
        self.o_TVALID = controlUnit.o_TVALID
        self.o_TDATA = accumulator.o_TDATA



core = Core()



