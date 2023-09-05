#If we have a class such as the one below: Explain what the @@cats_count variable does and how it works. What code would you need to write to test your theory?

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

# @@cats_count is a class variable available to all instances of Cat. For each new Cat object, the constructor increments @@cats_count by 1. There is also a class method which exposes the @@cats_count. We can test this code as such:

p Cat.cats_count # => 0
Cat.new('tabby')
Cat.new('hairless')
Cat.new('Siamese')
p Cat::cats_count # => 3