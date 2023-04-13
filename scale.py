import math


class Shape:
    def scale(self, factor):
        raise NotImplementedError("Subclass must implement scale method")

class Rectangle(Shape):
    def __init__(self, width, height):
        self.width = width
        self.height = height

    def area(self):
        return self.width * self.height

    def scale(self, factor):
        self.width *= factor
        self.height *= factor

class Circle(Shape):
    def __init__(self, radius):
        self.radius = radius

    def area(self):
        return math.pi * self.radius**2

    def scale(self, factor):
        self.radius *= factor

class Square(Rectangle):
    def __init__(self, side_length):
        super().__init__(side_length, side_length)

rect = Rectangle(3, 4)
circ = Circle(5)
square = Square(5)

print(rect.area())  # 12
print(circ.area())  # 78.53981633974483
print(square.area())  # 25

rect.scale(2)
circ.scale(2)
square.scale(2)

print(rect.area())  # 24
print(circ.area())  # 314.1592653589793
print(square.area())  # 100
