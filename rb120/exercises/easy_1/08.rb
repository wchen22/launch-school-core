# Given the following class:

class Rectangle
  def initialize(height, width)
    @height = height
    @width = width
  end

  def area
    @height * @width
  end
end

# Write a class called Square that inherits from Rectangle, and is used like this:

class Square < Rectangle
  def initialize(width)
    super(width, width)
  end

  def dimensions
    puts "#{@height} by #{@width} square"
  end
end

square = Square.new(5)
puts "area of square = #{square.area}"
square.dimensions

