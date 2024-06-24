import random


class Giver:
    '''
     z (dimension z)
     3\
      2\  
       1\________ x (dimension x)
       1|1  2  3 
       2|
       3|
        y (dimension y)


        len_x
        len_y
        len_z
    '''
    def __init__(self,dimension_x,dimension_y,dimension_z) -> None:
        self.dimension_z = dimension_z
        self.dimension_y = dimension_y
        self.dimension_x = dimension_x
        self.matrix = [[[random.randint(0,3) for _ in range(self.dimension_x)] for _ in range(self.dimension_y)] for _ in range(self.dimension_z)]


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



filter_1 = Giver(2,2,2)
filter_2 = Giver(2,2,2)
filter_3 = Giver(2,2,2)


image = Giver(5,5,3)

print('filter 1')
filter_1.information()
print('filter 2')
filter_2.information()


class Core:
    def __init__(self,filters) -> None:
        self.filters = filters

    def operation():
        acc = 0
        for z in range(filter_1.dimension_z):
            for y in range(filter_1.dimension_y):
                for x in range(filter_1.dimension_x):
                    acc = acc + (filter_1.matrix[z][y][x] * filter_2.matrix[z][y][x])

        print(acc)

