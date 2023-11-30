# class Animal
#   BRAINS = 1
#   @@description = "Class for all sorts of animals"
#   @@members = []

#   def self.members
#     @@members
#   end
#   def self.description
#     @@description
#   end
#   def self.description=(string)
#     @@description = string
#   end
# end

# module Barkable
#   BARK = 'loud'
#   @@speak = 'arf'
# end


# class Dog < Animal
#   LEGS = 4
#   include Barkable
#   def initialize(name)
#     @@description += ' especially Dogs'
#     @@members << name
#     puts @@speak
#     puts @@description
#     puts LEGS
#     puts BRAINS
#     puts BARK
#   end

#   def self.generic_name
#     "Fido"
#   end

#   def speak
#     puts generic_name
#   end
# end

# my_dog = Dog.new('Fido')
# puts Dog::generic_name
# puts Dog::members
# puts Dog::description
# Dog::description = 'asdf'
# puts Dog::description
# second_dog = Dog.new('Luna')

# p Dog::members

class Dog
  def initialize(breed)
    @breed = breed
  end

  def is_compatible_with?(other_dog)
    self.breed == other_dog.breed
  end

  protected
  def breed
    @breed
  end
end

fido = Dog.new("corgi")
luna = Dog.new("corgi")
p fido.is_compatible_with?(luna)
p fido.breed