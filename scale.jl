abstract type Shape end
abstract type Quadrilateral <: Shape end

struct Rectangle <: Quadrilateral
    width::Float64
    height::Float64
end

struct Circle <: Shape
    radius::Float64
end

struct Square <: Quadrilateral
    side_length::Float64
end

area(shape::Rectangle) = shape.width * shape.height
area(shape::Circle) = π * shape.radius^2
area(shape::Square) = shape.side_length^2

scale(shape::Rectangle, factor) = Rectangle(shape.width * factor, shape.height * factor)
scale(shape::Circle, factor) = Circle(shape.radius * factor)
scale(shape::Square, factor) = Square(shape.side_length * factor)

rect = Rectangle(3, 4)
circ = Circle(5)
square = Square(5)

println(area(rect))  # 12.0
println(area(circ))  # 78.53981633974483
println(area(square))  # 25.0

scaled_rect = scale(rect, 2)
scaled_circ = scale(circ, 2)
scaled_square = scale(square, 2)

println(area(scaled_rect))  # 24.0
println(area(scaled_circ))  # 314.1592653589793
println(area(scaled_square))  # 100.0
