# In the last question we had a module called Speed which contained a go_fast method. We included this module in the Car class as shown below.

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

# When we called the go_fast method from an instance of the Car class (as shown below) you might have noticed that the string printed when we go fast includes the name of the type of vehicle we are using. How is this done?

# >> small_car = Car.new
# >> small_car.go_fast
# I am a Car and going super fast!

# => When the Speed module is mixed into the Car class, go_fast becomes available to Car objects as an instance method. Therefore, the `self` call within the puts statement refers to the object instance calling the method. Calling `class` upon that object will return the class, and since the whole expression is wrapped up in the #{} notation, it becomes interpolated as a string, calling the #to_s method on the class. By default this will just return the class name as a string.