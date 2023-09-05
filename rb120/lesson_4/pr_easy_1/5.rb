# Which of these two classes would create objects that would have an instance variable and how do you know?

class Fruit
  def initialize(name)
    name = name
  end
end

# THIS ONE: @name is the notation used to initialize an instance variable. In the Fruit class above, the local variable name is just being pointed to the object it references already.

class Pizza
  def initialize(name)
    @name = name
  end
end

# Can also use #instance_variables

p Pizza.new("hawaiian").instance_variables # => [:@name]
p Fruit.new("pineapple").instance_variables # => []