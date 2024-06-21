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
        # output
        self.i_TREADY = 0
        self.k_TREADY = 0
        self.b_TREADY = 0
        self.o_TVALID = 0
        self.r1_enable = 0
        self.r2_enable = 0
        self.m_enable = 0
        # states
        self.state = Statetype.S0
        self.nextstate = Statetype.S0

    def transition(self, reset, i_TVALID, k_TVALID, b_TVALID, o_TREADY, new_i):

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
