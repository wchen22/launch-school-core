# Write a method called age that calls a private method to calculate the age of the vehicle. Make sure the private method is not available from outside of the class. You'll need to use Ruby's built-in Time class to help.



module RoofLoadable
  def load_roof(item, vehicle)
    puts "#{item} has been added to the roof of the #{vehicle}"
  end
end

class Vehicle
  attr_accessor :name, :year

  @@vehicles_created = 0

  def self.vehicles_created
    puts "#{@@vehicles_created} vehicles have been created"
  end

  def self.gas_mileage(miles, gallons)
    "#{miles / gallons} miles per gallon"
  end

  def initialize(name, year)
    @name = name
    @year = year
    @@vehicles_created += 1
  end
  
  def start
    puts "The vehicle is starting!"
  end

  def park(model)
    puts "You pull the #{model} into the parking lot"
  end

  def info
    puts "The #{name} is #{age} years old"
  end

  private
  def age
    age = Time.new.year - Time.new(year).year
  end
end

class MyCar < Vehicle
  include RoofLoadable
  TRUNK_TYPE = "frunk"

  def initialize(name, year, model)
    super(name, year)
    @model = model
  end

  def open_trunk
    puts "The #{@name}'s #{TRUNK_TYPE} is opening!"
  end

  def park
    super @model
  end


end

class MyTruck < Vehicle
  TOW_CAPACITY_LBS = 3000
end

toyota = MyCar.new("mystery machine", 2008, "chevy")
toyota.start
p toyota.name
p toyota.year
toyota.open_trunk
toyota.park
toyota.info

p Vehicle.gas_mileage(4000,22)
Vehicle.vehicles_created

toyota.load_roof("skis", toyota.name)

# 4. Print to the screen your method lookup for the classes that you have created.

puts MyTruck.ancestors
p MyCar.ancestors
puts Vehicle.ancestors
