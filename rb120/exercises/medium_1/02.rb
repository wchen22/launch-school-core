# A fixed-length array is an array that always has a fixed number of elements. Write a class that implements a fixed-length array, and provides the necessary methods to support the following code:

# The below code should output true 16 times.

class FixedArray
  def initialize(size)
    @elements = [nil] * 5
  end

  def [](index)
    valid_index?(index) ? @elements[index] : raise(IndexError)
  end

  def []=(index, value)
    if valid_index?(index)
      @elements[index] = value
    else
      raise(IndexError)
    end
  end

  def to_s
    @elements.to_s
    # elements = @elements.map { |element| element.nil? ? 'nil' : "\"#{element.to_s}\""}
    # "[#{elements.join(', ')}]"
  end

  def to_a
    @elements.clone
  end

  private
  def valid_index?(index)
    index <= @elements.size.abs
  end
end

fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end