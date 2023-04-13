abstract type Shape end

struct Rectangle <: Shape
    width::Float64
    height::Float64
end

struct Circle <: Shape
    radius::Float64
end

area(shape::Rectangle) = shape.width * shape.height
area(shape::Circle) = π * shape.radius^2

rect = Rectangle(3, 4)
circ = Circle(5)

println(area(rect))  # 12.0
println(area(circ))  # 78.53981633974483
