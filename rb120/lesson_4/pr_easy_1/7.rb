# If we have a class such as the one below, You can see in the make_one_year_older method we have used self. What does self refer to here?

class Cat
attr_accessor :type, :age

def initialize(type)
  @type = type
  @age  = 0
end

def make_one_year_older
  self.age += 1
end
end

# Since make_one_year_older is an instance method, self here refers to the object instance. It will look for a setter method available to the object instance as well. 