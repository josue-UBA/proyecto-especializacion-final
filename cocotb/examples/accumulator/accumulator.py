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

