# What are the benefits of using Object Oriented Programming in Ruby? Think of as many as you can.

=begin
 
Encapsulation: Can group related states and behavior into objects. This allows for better organized code, and also allows programmers to hide methods and calculations under the hood if they don't want them to be exposed outside of the purposes of the object.

Abstraction: Makes for more readable code, because you can now do things like call Car.new.drive without having to worry about things under the hood like how the engine and ignition work or how the pedal is used to accelerate, etc. 

Inheritance: Makes for reusable code. When objects can share behaviors, we can use inheritance to pass those behaviors down an inheritance chain without having to rewrite them. Also allows us to represent hierarchical "is-a" type of object relationships.

Polymorphism: Makes for reusable code, but different from inheritance. If we have different classes that aren't strictly related on an inheritance basis, say Human and Dog, we use duck-typing to define a shared behavior like #walk within each class, and then can call walk on objects of either class without worrying about the different implementation details.

=end