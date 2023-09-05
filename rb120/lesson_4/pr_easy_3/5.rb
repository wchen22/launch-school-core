# If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# What would happen if I called the methods like shown below?

tv = Television.new
tv.manufacturer # NoMethodError
tv.model # Would call model instance method which returns nil

Television.manufacturer # Would call manufacturer class method which returns nil
Television.model # NoMethodError