# If we have a class such as the one below: In the name of the cats_count method we have used self. What does self refer to in this context?

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# self is called in the context of the class definition, and so it refers to the Cat class, making a class method which can be called as Cats.cats_count.

p Cat.cats_count # Using dot operator which is used to access methods of a class

fluffy = Cat.new("tabby")

p Cat::cats_count # Using namespace resolution operator,which is used to access constants, class methods, and instance methods.
p fluffy.class.cats_count