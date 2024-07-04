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

    def __init__(self,dim_z, dim_y, dim_x):
        self.dim_z = dim_z
        self.dim_y = dim_y
        self.dim_x = dim_x
        self.matrix = [[[random.randint(0,9) for _ in range(self.dim_x)] for _ in range(self.dim_y)] for _ in range(self.dim_z)]
        self.ind_x = 0
        self.ind_y = 0
        self.ind_z = 0
        self.state = 0
        self.state_0 = 0
        self.state_1 = 1
        self.state_2 = 2
        self.state_3 = 3
    
    def clock(self):
        if self.state == self.state_0:
            self.ind_x = self.ind_x + 1
            if self.ind_x < self.dim_x:
                self.state = self.state_0
            else:
                self.state = self.state_1

        elif self.state == self.state_1:
            self.ind_x = 0
            self.ind_y = self.ind_y + 1
            if self.ind_y < self.dim_y:
                self.state = self.state_0
            else:
                self.state = self.state_2

        elif self.state == self.state_2 :
            self.ind_y = 0
            self.ind_z = self.ind_z + 1
            if self.ind_z < self.dim_z:
                self.state = self.state_0
            else:
                self.state = self.state_3

        elif self.state == self.state_3:
            self.ind_z = 0

        
    def show_indexes(self):
        print(self.ind_x, self.ind_y, self.ind_z)

    def information(self):
        for i in self.matrix:
            for j in i:
                print(j)

            print()

        print(f"a[z][y][x]")
        for i in range(3):
            x = random.randint(0,self.dim_x-1)
            y = random.randint(0,self.dim_y-1)
            z = random.randint(0,self.dim_z-1)
            print(f"a[{z}][{y}][{x}]",self.matrix[z][y][x])


class ImageProvider(Provider):

    def __init__(self,dimension_z,dimension_y,dimension_x,kernel_x,kernel_y):
        # Llama al método __init__ de la clase base
        super().__init__(dimension_z,dimension_y,dimension_x)
        # Añade inicialización para la clase derivada
        self.kernel_x = kernel_x
        self.kernel_y = kernel_y

        self.phase_x = 0
        self.phase_y = 0






    def generate_output(self):
        output = []
        for i in range(self.dim_x-self.kernel_x+1):
            aux_list = []
            for j in range(self.dim_y-self.kernel_y+1):
                a = [i,j]#conv_with_shift(i,j)
                print()
                aux_list.append(a)
            output.append(aux_list)

            
provider = Provider(2,3,3) 



for i in range(40):
    provider.clock()
    provider.show_indexes()