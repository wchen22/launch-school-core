# Let's create a few more methods for our Dog class.

# class Dog
#   def speak
#     'bark!'
#   end

#   def swim
#     'swimming!'
#   end

#   def run
#     'running!'
#   end

#   def jump
#     'jumping!'
#   end

#   def fetch
#     'fetching!'
#   end
# end

# Create a new class called Cat, which can do everything a dog can, except swim or fetch. Assume the methods do the exact same thing. Hint: don't just copy and paste all methods in Dog into Cat; try to come up with some class hierarchy.

class Animal
  def speak(noise)
    noise
  end

  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Animal
  def speak
    super('bark!')
  end

  def swim
    'swimming!'
  end
  
  def fetch
    'fetching!'
  end
end

class Cat < Animal
  def speak
    super('meow!')
  end
end

luna = Cat.new
rufus = Dog.new

p rufus.speak
p rufus.jump
p rufus.swim
p rufus.fetch
p rufus.run

p luna.speak
p luna.jump
p luna.run
p luna.fetch # NoMethod Error


# 04 What is the method lookup path and how is it important?

# The method lookup path is the order of scopes in which Ruby checks for a method when it is called. The path starts with methods in the subclass of the calling object. If not found, it will look for any modules included. If still not found, it will move up the object hierarchy to the next superclass, then to any modules in the superclass, and so on. If multiple modules have conflicting methods, the last module added will be checked first.