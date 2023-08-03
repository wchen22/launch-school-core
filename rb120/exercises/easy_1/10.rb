# Refactor these classes so they all use a common superclass, and inherit behavior as needed.

class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def to_s
    "#{make} #{model}"
  end
end

class Car < Vehicle
  def wheels
    4
  end
end

class Motorcycle < Vehicle
  def wheels
    2
  end
end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end

  def wheels
    6
  end
end

camry = Car.new("toyota", "camry")
puts camry
puts camry.wheels

yamaha = Motorcycle.new("yamaha", "2009")
puts yamaha
puts yamaha.wheels

ford = Truck.new("Ford", "2011", 1500)
puts ford
puts ford.wheels
puts ford.payload

# Further Exploration
# Would it make sense to define a wheels method in Vehicle even though all of the remaining classes would be overriding it? Why or why not? If you think it does make sense, what method body would you write?

# Defining a wheels method in Vehicle would make sense if there was additional logic that would apply to all subclasses. For example if we change the return value to a string that prints "The Toyota Camry has 4 wheels", which involves the @make and @model instance variables universal to all subclasses, it could lead to DRYer code. 