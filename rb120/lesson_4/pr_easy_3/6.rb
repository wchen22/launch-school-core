# If we have a class such as the one below:

class Cat
  attr_accessor :type
  attr_reader :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def age=(value)
    @age = value
  end

  def make_one_year_older
    @age += 1
  end
end

# In the make_one_year_older method we have used self. What is another way we could write this method so we don't have to use the self prefix?

# Could make a reference to the instance variable 

tabby = Cat.new("tabby")
puts tabby.age
tabby.make_one_year_older
puts tabby.age

