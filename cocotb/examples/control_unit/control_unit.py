from enum import Enum

class Statetype(Enum):
    S0 = 0
    S1 = 1
    S2 = 2
    S3 = 3
    S4 = 4
    S5 = 5

class DFF:
    def __init__(self):
        self.reset = 0
        self.i_TVALID = 0
        self.k_TVALID = 0
        self.b_TVALID = 0
        self.o_TREADY = 0
        self.new_i = 0

        self.state = Statetype.S0
        self.nextstate = Statetype.S0

    def transition(self, reset, i_TVALID, k_TVALID, b_TVALID, o_TREADY, new_i):
        self.reset = reset 
        self.i_TVALID = i_TVALID 
        self.k_TVALID = k_TVALID 
        self.b_TVALID = b_TVALID 
        self.o_TREADY = o_TREADY 
        self.new_i = new_i

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

        return self.state

    def output_logic(self):
        i_TREADY = 1 if self.state in {Statetype.S2, Statetype.S3, Statetype.S4, Statetype.S5} else 0
        k_TREADY = 1 if self.state in {Statetype.S2, Statetype.S3, Statetype.S4, Statetype.S5} else 0
        b_TREADY = 1 if self.state == Statetype.S2 else 0
        o_TVALID = 1 if self.state == Statetype.S5 else 0
        r_enable = 1 if self.state in {Statetype.S0, Statetype.S1, Statetype.S2, Statetype.S3} else 0
        a_enable = 1 if self.state in {Statetype.S0, Statetype.S1, Statetype.S2, Statetype.S3, Statetype.S5} else 0
        b_enable = 1 if self.state in {Statetype.S0, Statetype.S1} else 0
        return i_TREADY, k_TREADY, b_TREADY, o_TVALID, r_enable, a_enable, b_enable

# Ejemplo de uso
dff_inst = DFF()
# outputs = dff_inst.output_logic()
