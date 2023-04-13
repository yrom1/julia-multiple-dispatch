# julia-multiple-dispatch

# area

Julia's multiple dispatch system allows you to easily define and extend the behavior of functions based on the types of their input arguments. This can lead to simpler, more flexible, and extensible code. Let's consider a simple example to demonstrate this, using geometric shapes.

Suppose you need to calculate the area of different geometric shapes: rectangles and circles. In Python, you might do this using classes with methods.

The Julia code is more elegant and extensible due to multiple dispatch. You can easily add support for new shapes without modifying the existing code or creating additional methods. For example, to support triangles, you can simply define a new struct and an area function for that struct.

In Python, you would have to create a new class with its own area method, which can lead to more boilerplate code and less flexibility. Julia's multiple dispatch system allows for cleaner and more modular code that can be extended with ease.

# scale

Let's consider an example where we want to extend our shapes hierarchy with a new type of shape: a square, which is a special case of a rectangle. We will also add a function to scale the shapes.

In Python, you might use inheritance to create a Square class, extending the Rectangle class:

However, using inheritance can lead to issues. For example, if you wanted to add the scale method to other shapes, you'd need to define the method in each class, leading to code duplication and increased maintenance complexity:

Now let's see how Julia's multiple dispatch system handles this:

In Julia, we can use multiple dispatch to define a common scale function for different shapes without modifying the existing structs. We can also reuse the existing Rectangle implementation for squares by defining a simple conversion method. This leads to cleaner, more modular, and more easily extensible code.

Moreover, Julia's approach allows you to easily extend the behavior of the scale function for new shapes without modifying the original implementation. In Python, you would need to define a new method for each shape, which can lead to code duplication and increased maintenance complexity.

---

You're right, in Julia, structs cannot subtype other structs directly. Instead, inheritance in Julia is achieved using abstract types. In Julia, you can only subtype abstract types, and this is how you create a hierarchy of types. Structs in Julia are designed to be lightweight and focused on representing data, not building complex inheritance hierarchies.

Here's an example to illustrate how to create multiple levels of inheritance using abstract types in Julia:

```julia
abstract type Animal end

abstract type Mammal <: Animal end
abstract type Bird <: Animal end

struct Dog <: Mammal
    name::String
    age::Int
end

struct Cat <: Mammal
    name::String
    age::Int
end

struct Eagle <: Bird
    name::String
    age::Int
end
```

In this example, we create an abstract type Animal. Then, we create two more abstract types, Mammal and Bird, that subtype Animal. Finally, we define three structs (Dog, Cat, and Eagle) that subtype Mammal and Bird. This creates a simple hierarchy of types.

To achieve polymorphism and work with different subtypes, you can use multiple dispatch:

```julia
say(sound::Dog) = println("$(sound.name) says: Woof!")
say(sound::Cat) = println("$(sound.name) says: Meow!")
say(sound::Eagle) = println("$(sound.name) says: Caw!")

dog = Dog("Buddy", 5)
cat = Cat("Whiskers", 3)
eagle = Eagle("Freedom", 7)

say(dog)    # Buddy says: Woof!
say(cat)    # Whiskers says: Meow!
say(eagle)  # Freedom says: Caw!
```

In this example, we define a say function that has different implementations for Dog, Cat, and Eagle. When we call the say function with different instances, the appropriate implementation is dispatched based on the type of the input.

Keep in mind that Julia's approach to inheritance and polymorphism is different from object-oriented languages like Python. Julia uses abstract types to create hierarchies and multiple dispatch to define behavior based on types. This leads to a more modular and flexible code compared to traditional object-oriented languages.

---

I apologize for any confusion in the previous example. You're correct that it could be improved. To address your concerns, we can revise the code by introducing a Quadrilateral abstract type and making Square a subtype of Shape:

Now, Square is a subtype of Shape through the Quadrilateral abstract type, which better reflects its role as a shape. The area and scale functions are defined for each specific shape, including the Square, without the need for a conversion function like to_rectangle. This should make the code more intuitive and address the concerns you raised.
