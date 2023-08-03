# Write a class that will display:

# ABC
# xyz

class Transform
  def self.lowercase(text)
    text.downcase
  end

  def initialize(data)
    @data = data
  end

  def uppercase
    @data.upcase
  end

end

# when this is run
my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')