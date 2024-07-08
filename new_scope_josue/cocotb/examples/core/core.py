from enum import Enum

class Statetype(Enum):
    S0 = 0
    S1 = 1
    S2 = 2
    S3 = 3
    S4 = 4
    S5 = 5

class ControlUnit:
    def __init__(self):
        # states
        self.state = Statetype.S0
        self.nextstate = Statetype.S0

        # output
        self.i_TREADY = 0
        self.k_TREADY = 0
        self.b_TREADY = 0
        self.o_TVALID = 0
        self.r1_enable = 0
        self.r2_enable = 0
        self.m_enable = 0

    def transition(self, 
        reset, 
        i_TVALID, 
        k_TVALID, 
        b_TVALID, 
        o_TREADY, 
        new_i):

        self.state = self.nextstate

        if reset:
            self.nextstate = Statetype.S0

        elif self.state == Statetype.S0:
            if not new_i:
                self.nextstate = Statetype.S0
            elif new_i and i_TVALID and k_TVALID and b_TVALID:
                self.nextstate = Statetype.S2
            else:
                self.nextstate = Statetype.S1

        elif self.state == Statetype.S1:
            if not i_TVALID or not k_TVALID or not b_TVALID:
                self.nextstate = Statetype.S1
            else:
                self.nextstate = Statetype.S2

        elif self.state == Statetype.S2:
            self.nextstate = Statetype.S3

        elif self.state == Statetype.S3:
            if i_TVALID and k_TVALID:
                self.nextstate = Statetype.S3
            elif not new_i:
                self.nextstate = Statetype.S5
            else:
                self.nextstate = Statetype.S4

        elif self.state == Statetype.S4:
            if not i_TVALID or not k_TVALID:
                self.nextstate = Statetype.S4
            else:
                self.nextstate = Statetype.S3

        elif self.state == Statetype.S5:
            if not o_TREADY:
                self.nextstate = Statetype.S5
            else:
                self.nextstate = Statetype.S1
        self.output_logic()

    def output_logic(self):
        self.i_TREADY = 1 if self.state in {Statetype.S2, Statetype.S3, Statetype.S4, Statetype.S5} else 0
        self.k_TREADY = 1 if self.state in {Statetype.S2, Statetype.S3, Statetype.S4, Statetype.S5} else 0
        self.b_TREADY = 1 if self.state == Statetype.S2 else 0
        self.o_TVALID = 1 if self.state == Statetype.S5 else 0
        self.r1_enable = 1 if self.state in {Statetype.S0, Statetype.S1, Statetype.S2, Statetype.S3} else 0
        self.r2_enable = 1 if self.state in {Statetype.S0, Statetype.S1, Statetype.S2, Statetype.S3, Statetype.S5} else 0
        self.m_enable = 1 if self.state in {Statetype.S0, Statetype.S1} else 0

# Ejemplo de uso
controlUnit = ControlUnit()

class Accumulator:
    def __init__(self):
        # internal variables
        self.mult = 0
        self.a = 0
        self.b = 0
        self.c = 0
        self.state = "S0"
        
        # output
        self.o_TDATA = 0

    def accumulate(
            self,
            reset,
            r2_enable,
            r1_enable,
            m_enable,
            i_TDATA,
            k_TDATA,
            b_TDATA,
        ):
        if self.state == "S0":
            self.a = self.mult

            self.b = self.a + self.c
            self.mult = k_TDATA * i_TDATA
            self.state = "S1"

        elif self.state == "S1":
            self.o_TDATA = self.b
            self.a = self.mult
            
            
            self.c = b_TDATA if m_enable else self.o_TDATA
            
            self.b = self.a + self.c
            self.mult = k_TDATA * i_TDATA
            self.state = "S1"

# Ejemplo de uso
accumulator = Accumulator()


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
        
        controlUnit.transition(
            reset, 
            i_TVALID, 
            k_TVALID, 
            b_TVALID, 
            o_TREADY, 
            new_i)


        accumulator.accumulate(
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



