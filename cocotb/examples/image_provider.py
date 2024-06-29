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

    def __init__(self,dimension_z, dimension_y, dimension_x):
        self.dimension_z = dimension_z
        self.dimension_y = dimension_y
        self.dimension_x = dimension_x
        self.matrix = [[[random.randint(0,9) for _ in range(self.dimension_x)] for _ in range(self.dimension_y)] for _ in range(self.dimension_z)]
        self.index_x = 0
        self.index_y = 0
        self.index_z = 0
        self.state = 0
        self.state_0 = 0
        self.state_1 = 1
        self.state_2 = 2
        self.state_2 = 3
    
    def clock(self):
        if self.state == self.state_0:
            self.index_x = self.index_x + 1
            if self.index_x < self.dimension_x:
                self.state = self.state_0
            else:
                self.state = self.state_1

        elif self.state == self.state_1:
            self.index_x = 0
            self.index_y = self.index_y + 1
            if self.index_y < self.dimension_y:
                self.state = self.state_0
            else:
                self.state = self.state_2

        elif self.state == self.state_2 :
            self.index_y = 0
            self.index_z = self.index_z + 1
            if self.index_z < self.dimension_z:
                self.state = self.state_0
            else:
                self.state = self.state_3

        elif self.state == self.state_3:
            self.index_z = 0

        
    def show_indexes(self):
        print(self.index_x, self.index_y, self.index_z)

    def information(self):
        for i in self.matrix:
            for j in i:
                print(j)

            print()

        print(f"a[z][y][x]")
        for i in range(3):
            x = random.randint(0,self.dimension_x-1)
            y = random.randint(0,self.dimension_y-1)
            z = random.randint(0,self.dimension_z-1)
            print(f"a[{z}][{y}][{x}]",self.matrix[z][y][x])


class ImageProvider(Provider):

    def __init__(self,dimension_z,dimension_y,dimension_x,kernel_x,kernel_y):
        # Llama al método __init__ de la clase base
        super().__init__(dimension_z,dimension_y,dimension_x)
        # Añade inicialización para la clase derivada
        self.kernel_x = kernel_x
        self.kernel_y = kernel_y


    def generate_output(self):
        output = []
        for i in range(self.dimension_x-self.kernel_x+1):
            aux_list = []
            for j in range(self.dimension_y-self.kernel_y+1):
                a = [i,j]#conv_with_shift(i,j)
                print()
                aux_list.append(a)
            output.append(aux_list)

            
provider = Provider() 


# core = Core([filter_1,filter_2,filter_2])
# print(core.operation(core.filters[0],core.filters[1]))


# kernel_provider1 = Provider(4,3,3)
# kernel_provider2 = Provider(4,3,3)
# kernel_provider3 = Provider(2,2,2)
# kernel_provider1.information()

image_provider = ImageProvider(3,4,4)
image_provider.generate_output()

# print('filter 1')
# filter_1.information()
# print()
# print()
# print('filter 2')
# filter_2.information()
