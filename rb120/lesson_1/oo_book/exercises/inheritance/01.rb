# Then create a new class called MyTruck that inherits from your superclass that also has a constant defined that separates it from the MyCar class in some way.

# Create a superclass called Vehicle for your MyCar class to inherit from and move the behavior that isn't specific to the MyCar class to the superclass. Create a constant in your MyCar class that stores information about the vehicle that makes it different from other types of Vehicles.

class Vehicle
  def self.gas_mileage(miles, gallons)
    "#{miles / gallons} miles per gallon"
  end

  attr_accessor :name

  def initialize(name)
    @name = name
  end
  
  def start
    puts "The vehicle is starting!"
  end
end

class MyCar < Vehicle
  TRUNK_TYPE = "frunk"

  def open_trunk
    puts "The #{@name}'s #{TRUNK_TYPE} is opening!"
  end


end

class MyTruck < Vehicle
  TOW_CAPACITY_LBS = 3000
end

toyota = MyCar.new("camry")
toyota.start
p toyota.name
toyota.open_trunk

p Vehicle.gas_mileage(4000,22)