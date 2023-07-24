# Add a class variable to your superclass that can keep track of the number of objects created that inherit from the superclass. Create a method to print out the value of this class variable as well.

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
Vehicle.vehicles_created