class Accumulator:
    def __init__(self):
        self.output = 0
        self.a = 0
        self.b = 0
        self.c = 0
        self.state = "S0"
        
        self.o_TDATA = 0

    def accumulate(self, k_TDATA, i_TDATA):
        
        if self.state == "S0":
            self.a = self.output

            self.b = self.a + self.c
            self.output = k_TDATA * i_TDATA
            self.state = "S1"

        elif self.state == "S1":
            self.o_TDATA = self.b
            self.a = self.output
            
            self.c = self.o_TDATA
            self.b = self.a + self.c
            self.output = k_TDATA * i_TDATA
            self.state = "S1"

        return self.o_TDATA

# Ejemplo de uso
accumulator = Accumulator()

