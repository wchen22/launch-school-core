# In the previous exercise, you developed a method that converts non-negative numbers to strings. In this exercise, you're going to extend that method by adding the ability to represent negative numbers as well.

# Write a method that takes an integer, and converts it to a string representation.

# You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. You may, however, use integer_to_string from the previous exercise.

# Let's reuse some code from last exercise
DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(int)
  output = ''
  loop do
    int, digit = int.divmod(10)
    output.prepend(DIGITS[digit])
    break if int == 0
  end
  output
end

def signed_integer_to_string(signed_int)
  if signed_int > 0
    '+' + integer_to_string(signed_int)
  elsif signed_int < 0
    '-' + integer_to_string(signed_int.abs)
  else
    '0'
  end
end

# Further Exploration
# Refactor our solution to reduce the 3 integer_to_string calls to just one.

def signed_integer_to_string(signed_int)
  abs_string = integer_to_string(signed_int.abs)
  case signed_int <=> 0
  when -1 then "-#{abs_string}"
  when 1 then "+#{abs_string}"
  else "0"
  end
end

# Examples

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'