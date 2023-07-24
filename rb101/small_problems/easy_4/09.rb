# In the previous two exercises, you developed methods that convert simple numeric strings to signed Integers. In this exercise and the next, you're going to reverse those methods.

# Write a method that takes a positive integer or zero, and converts it to a string representation.

# You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. Your method should do this the old-fashioned way and construct the string by analyzing and manipulating the number.

# Algorithm
  # Hash with 0 => '0', etc
  # Set output = ''
  # Loop do
    # next_digit = number % 10
    # insert HASH[next_digit]
    # number -= next_digit
    # number /= 10
    # break if number == 0
  # Return output

INT_TO_CHAR = {
  0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 
  5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9'
}

def integer_to_string(int)
  output = ''
  loop do
    digit = int % 10
    output.insert(0, INT_TO_CHAR[digit])
    int /= 10
    break if int == 0
  end
  output
end

# Examples

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'