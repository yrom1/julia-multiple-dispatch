import math


class Rectangle:
    def __init__(self, width, height):
        self.width = width
        self.height = height

    def area(self):
        return self.width * self.height

class Circle:
    def __init__(self, radius):
        self.radius = radius

    def area(self):
        return math.pi * self.radius**2

rect = Rectangle(3, 4)
circ = Circle(5)

print(rect.area())  # 12
print(circ.area())  # 78.53981633974483
