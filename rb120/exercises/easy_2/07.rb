# Write the classes and methods that will be necessary to make this code run, and print the following output:

class Pet
  attr_reader :species, :name

  def initialize(species, name)
    @species = species
    @name = name
  end

  def to_s
    "a #{species} named #{name}"
  end
end

class Owner
  attr_reader :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def add_pet(pet)
    @pets << pet
  end

  def number_of_pets
    @pets.size
  end
end

class Shelter
  def initialize
    @adoptions = Hash.new
    @pets = []
  end

  def take_in(pet)
    @pets << pet
  end

  def adopt(owner, pet)
    owner.add_pet(pet)
    @pets.delete(pet)

    @adoptions[owner] ||= []
    @adoptions[owner] << pet
  end

  def print_unadopted_pets
    puts "The shelter has #{@pets.size} pets available for adoption:"

    @pets.each do |pet|
      puts pet
    end
  end
  def print_adoptions
    @adoptions.each do |owner, pets|
      puts "#{owner.name} has adopted the following pets:"

      pets.each do |pet|
        puts pet
      end

      puts
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

asta = Pet.new('dog', "Asta")
laddie = Pet.new('dog', "Laddie")
fluffy = Pet.new('cat', "Fluffy")

shelter.take_in(asta)
shelter.take_in(laddie)
shelter.take_in(fluffy)

shelter.print_unadopted_pets
# a dog named Laddie
# a cat named Fluffy
# a cat named Kat
# a cat named Ben
# a parakeet named Chatterbox
# a parakeet named Bluebell
#    ...

=begin
  P Hanson has adopted the following pets:
a cat named Butterscotch
a cat named Pudding
a bearded dragon named Darwin

B Holmes has adopted the following pets:
a dog named Molly
a parakeet named Sweetie Pie
a dog named Kennedy
a fish named Chester

P Hanson has 3 adopted pets.
B Holmes has 4 adopted pets.
=end

# Further Exploration
# Add your own name and pets to this project.

# Suppose the shelter has a number of not-yet-adopted pets, and wants to manage them through this same system. Thus, you should be able to add the following output to the example output shown above:

# The Animal Shelter has the following unadopted pets:
# a dog named Asta
# a dog named Laddie
# a cat named Fluffy
# a cat named Kat
# a cat named Ben
# a parakeet named Chatterbox
# a parakeet named Bluebell
#    ...

# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.
# The Animal shelter has 7 unadopted pets.

# Can you make these updates to your solution? Did you need to change your class system at all? Were you able to make all of your changes without modifying the existing interface?