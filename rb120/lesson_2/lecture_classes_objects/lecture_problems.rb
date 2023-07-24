# Given the below usage of the Person class, code the class definition.
puts "Part -----------1----------"
class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end


bob = Person.new('bob')
p bob.name                  # => 'bob'
bob.name = 'Robert'
p bob.name                  # => 'Robert'

# Modify the class definition from above to facilitate the following methods. Note that there is no name= setter method now.

puts "Part -----------2----------"

class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    @first_name, @last_name = full_name.split
    @last_name = "" if @last_name.nil?  
  end

  def name
    self.first_name + ' ' + self.last_name
  end
end

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'

# Now create a smart name= method that can take just a first name or a full name, and knows how to set the first_name and last_name appropriately.

puts "Part -----------3----------"


class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    @first_name, @last_name = full_name.split
    @last_name = "" if @last_name.nil?  
  end

  def name
    self.first_name + ' ' + self.last_name
  end

  def name=(name)
    first = name.split.first
    last = name.split.last

    @first_name = first
    @last_name = last if !last.nil?
  end
end

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
p bob.first_name            # => 'John'
p bob.last_name             # => 'Adams'

# Using the class definition from step #3, let's create a few more people -- that is, Person objects.

# If we're trying to determine whether the two objects contain the same name, how can we compare the two objects?


puts "Part -----------4----------"

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

p bob.name == rob.name

#Continuing with our Person class definition, what does the below code print out?

puts "Part -----------5----------"

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}" # Object ID

#Let's add a to_s method to fix this

class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    @first_name, @last_name = full_name.split
    @last_name = "" if @last_name.nil?  
  end

  def name
    self.first_name + ' ' + self.last_name
  end

  def name=(name)
    first = name.split.first
    last = name.split.last

    @first_name = first
    @last_name = last if !last.nil?
  end

  def to_s
    name
  end
end

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}" # => Now will print "Robert Smith"
