# Consider the following program.

class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet
  def initialize(name, age, color)
    super(name, age)
    @color = color
  end

  def to_s
    "My cat #{@name} is #{@age} years old and has #{@color} fur."
  end

end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch

# Update this code so that when you run it, you see the following output:

# My cat Pudding is 7 years old and has black and white fur.
# My cat Butterscotch is 10 years old and has tan and white fur.


# Further Exploration
# An alternative approach to this problem would be to modify the Pet class to accept a colors parameter. If we did this, we wouldn't need to supply an initialize method for Cat.

# Why would we be able to omit the initialize method? Would it be a good idea to modify Pet in this way? Why or why not? How might you deal with some of the problems, if any, that might arise from modifying Pet?

# We could omit the initialize method for Cat since it will inherit the constructor for Pet, which is what we'd want since there is no additional info needed for the state of our Cat objects.

# If we modify Pet in this way, it could be complicated to refactor code if in the future we have other Pet subclasses which don't need to use @colors. Or we want to have a different @colors implementation, for example pet mice which usually have a single color.