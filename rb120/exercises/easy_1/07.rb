# Fix the following so it works properly:

class Car
  attr_accessor :mileage

  def initialize
    @mileage = 0
  end

  def increment_mileage(miles)
    total = mileage + miles
    self.mileage = total 
    # Change was to call `mileage` on `self` so that Ruby knows to look for the setter instead of doing variable assignment.
    # Can also call @mileage = total and then make the attr_* attr_reader, this avoids extraneous setter. However, good practice to use setter in case there is extra checks or operations in the setter (e.g. `@mileage = miles.to_i`)
  end

  def print_mileage
    puts mileage
  end
end

car = Car.new
car.mileage = 5000
car.increment_mileage(678)
car.print_mileage  # should print 5678