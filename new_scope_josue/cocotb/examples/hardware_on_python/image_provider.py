import random




class Core:
    def __init__(self,filters,image) -> None:
        self.filters = filters
        pass

    def operation(self,provider_1,provider_2):
        acc = 0
        for z in range(provider_1.dimension_z):
            for y in range(provider_1.dimension_y):
                for x in range(provider_1.dimension_x):
                    acc = acc + (provider_1.matrix[z][y][x] * provider_2.matrix[z][y][x])

        return acc


class Provider:
    '''
           0________ x (dimension x)
          1|\1 1 2 3
          2| \2
          3|  \3
           y    z (dimension z)
    
    (dimension y)

    '''

    def __init__(
            self,
            dim_x,
            dim_y, 
            dim_z, 
            dim_k_x,            
            dim_k_y, 
            dim_k_z, 
            ):
        # STATIC
        # image dimentions
        self.dim_z = dim_z
        self.dim_y = dim_y
        self.dim_x = dim_x

        # kernel dimentions
        self.dim_k_z = dim_k_z
        self.dim_k_y = dim_k_y
        self.dim_k_x = dim_k_x

        # state
        self.state_0 = 0
        self.state_1 = 1
        self.state_2 = 2
        self.state_3 = 3
        self.state_4 = 4
        self.state_5 = 5
        self.state_6 = 6
        # matrix
        self.matrix = [[[random.randint(0,9) for _ in range(self.dim_x)] for _ in range(self.dim_y)] for _ in range(self.dim_z)]
        
        # VARIABLES
        # shift
        self.shi_x = 0
        self.shi_y = 0
        # index
        self.ind_x = 0
        self.ind_y = 0
        self.ind_z = 0
        # state
        self.shift_state = 0
        self.matrix_state = 0
        # enable
        self.enable = 0
        self.enable_shift = 0

    def clock(self):
        self.shift_logic()
        self.matrix_logic()
    
    def shift_logic(self):

        if self.shift_state == self.state_0:
            # next state logic
            if self.enable:
                self.shift_state = self.state_1
            else:
                self.shift_state = self.state_0

        elif self.shift_state == self.state_1:
            # output logic
            self.shi_x = 0
            self.shi_y = 0
            # next state logic
            self.shift_state = self.state_4
        
        elif self.shift_state == self.state_4:
            # next state logic
            if not self.enable_shift:
                self.shift_state = self.state_4
            elif self.shi_x != self.dim_x - self.dim_k_x:
                self.shift_state = self.state_2
            elif self.shi_x == self.dim_x - self.dim_k_x:
                self.shift_state = self.state_3
            elif self.shi_y == self.dim_y - self.dim_k_y:
                self.shift_state = self.state_1

        elif self.shift_state == self.state_3:
            # output logic
            self.shi_x = 0
            self.shi_y = self.shi_y + 1
            # next state logic
            self.shift_state = self.state_4
                
        elif self.shift_state == self.state_2:
            # output logic
            self.shi_x = self.shi_x + 1
            # next state logic
            self.shift_state = self.state_4

    def matrix_logic(self):
        if self.matrix_state == self.state_0:
            # next state logic
            if self.enable:
                self.matrix_state = self.state_1
            else:
                self.matrix_state = self.state_0

        elif self.matrix_state == self.state_1:
            # output logic
            self.ind_x = self.shi_x
            self.ind_y = self.shi_y
            self.ind_z = 0
            # next state logic
            self.matrix_state = self.state_4

        elif self.matrix_state == self.state_2:
            # output logic
            self.ind_x = self.shi_x
            self.ind_y = self.ind_y + 1
            # next state logic
            self.matrix_state = self.state_4

        elif self.matrix_state == self.state_3:
            # output logic
            self.ind_x = self.shi_x
            self.ind_y = self.shi_y
            self.ind_z = self.ind_z + 1
            # next state logic
            self.matrix_state = self.state_4

        elif self.matrix_state == self.state_4:
            # output logic
            self.ind_x = self.ind_x + 1
            # next state logic
            if self.ind_x == self.dim_k_x + self.shi_x - 3 and self.ind_y == self.dim_k_y + self.shi_y - 1 and self.ind_z == self.dim_k_z - 1:
                self.matrix_state = self.state_5
            elif self.ind_x == self.dim_k_x + self.shi_x - 1 and self.ind_y != self.dim_k_y + self.shi_y - 1:
                self.matrix_state = self.state_2
            elif self.ind_x != self.dim_k_x + self.shi_x - 1 and self.ind_y != self.dim_k_y + self.shi_y - 1:
                self.matrix_state = self.state_4
            elif self.ind_x == self.dim_k_x + self.shi_x - 1 and self.ind_y == self.dim_k_y + self.shi_y - 1 and self.ind_z != self.dim_k_z - 1:
                self.matrix_state = self.state_3

        elif self.matrix_state == self.state_5:
            # output logic
            self.ind_x = self.ind_x + 1
            self.enable_shift = 1
            # next state logic
            self.matrix_state = self.state_6

        elif self.matrix_state == self.state_6:
            # output logic
            self.ind_x = self.ind_x + 1
            self.enable_shift = 0
            # next state logic
            self.matrix_state = self.state_1


    def show_indexes(self):
        print(self.ind_x, self.ind_y, self.ind_z)

    def information(self):
        for i in self.matrix:
            for j in i:
                print(j)

            print()

        print(f"m(x,y,z)")
        for i in range(3):
            x = random.randint(0,self.dim_x-1)
            y = random.randint(0,self.dim_y-1)
            z = random.randint(0,self.dim_z-1)
            print(f"m({x},{y},{z}) =",self.matrix[z][y][x])



            
provider = Provider(7,7,2, 4,4,2) 
print("----------------")
provider.information()
print("----------------")
provider.enable = 1
for i in range(200):
    # if provider.ind_x == 3 and provider.ind_y == 3 and provider.ind_z == 1:
    #     print("aqui")
    provider.clock()
    provider.show_indexes()