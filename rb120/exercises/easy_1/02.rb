# Take a look at the following code. What output does this code print? Fix this class so that there are no surprises waiting in store for the unsuspecting developer.

class Pet
attr_reader :name

def initialize(name)
  @name = name.to_s
end

def to_s
  @name.upcase!
  "My name is #{@name}."
end
end

name = 'Fluffy'
fluffy = Pet.new(name) 
# String object 'Fluffy' is passed into the Pet class's constructor method and assigned to the local variable `name`. 
# `to_s` is called upon the object and returns the string representation and which is assigned to the instance variable `@name``.
puts fluffy.name # The object does have an available getter which will return `@name`, which is the string 'Fluffy' (THIS IS THE SAME OBJECT since String.to_s returns `self`)
puts fluffy # This calls the object's to_s method, which will destructively upcase! the instance variable to 'FLUFFY' and then print out => "My name is FLUFFY."
puts fluffy.name # 'FLUFFY'
puts name # 'FLUFFY'

# If we want the same thing without mutating the original `name` variable:

class Pet
  attr_reader :name
  
  def initialize(name)
    @name = name.to_s
  end
  
  def to_s
    "My name is #{@name.upcase}."
  end
end
  
name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

# Further Exploration
# What would happen in this case?

name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name #'42'
puts fluffy # "My name is 42"
puts fluffy.name #'42'
puts name # 43