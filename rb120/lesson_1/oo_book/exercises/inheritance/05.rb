# Move all of the methods from the MyCar class that also pertain to the MyTruck class into the Vehicle class. Make sure that all of your previous method calls are working when you are finished.

module RoofLoadable
  def load_roof(item, vehicle)
    puts "#{item} has been added to the roof of the #{vehicle}"
  end
end

class Vehicle
  attr_accessor :name

  @@vehicles_created = 0

  def self.vehicles_created
    puts "#{@@vehicles_created} vehicles have been created"
  end

  def self.gas_mileage(miles, gallons)
    "#{miles / gallons} miles per gallon"
  end

  def initialize(name)
    @name = name
    @@vehicles_created += 1
  end
  
  def start
    puts "The vehicle is starting!"
  end

  def park(model)
    puts "You pull the #{model} into the parking lot"
  end
end

class MyCar < Vehicle
  include RoofLoadable
  TRUNK_TYPE = "frunk"

  def initialize(name, model)
    super(name)
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

toyota = MyCar.new("mystery machine", "chevy")
toyota.start
p toyota.name
toyota.open_trunk
toyota.park

p Vehicle.gas_mileage(4000,22)
Vehicle.vehicles_created

toyota.load_roof("skis", toyota.name)

# 4. Print to the screen your method lookup for the classes that you have created.

puts MyTruck.ancestors
p MyCar.ancestors
puts Vehicle.ancestors
