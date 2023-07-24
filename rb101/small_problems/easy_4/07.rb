# The String#to_i method converts a string of numeric characters (including an optional plus or minus sign) to an Integer. String#to_i and the Integer constructor (Integer()) behave similarly. In this exercise, you will create a method that does the same thing.

# Write a method that takes a String of digits, and returns the appropriate number as an integer. You may not use any of the methods mentioned above.

# For now, do not worry about leading + or - signs, nor should you worry about invalid characters; assume all characters will be numeric.

# You may not use any of the standard conversion methods available in Ruby to convert a string to a number, such as String#to_i, Integer(), etc. Your method should do this the old-fashioned way and calculate the result by analyzing the characters in the string.

# Problem
  # Input: A string of numeric characters (do not worry about + - signs for now or validating input)
  # Output: Return integer representation of that string
  # Implicit: 
  # Explicit: Do not use #to_i, Integer()
# Examples/Test Cases
  # p string_to_integer('4321') == 4321 => true
  # p string_to_integer('570') == 570 => true
# Data Structure
  # Taking in the string, we will want to iterate over each character. Can do as an array or keep in string form
  # Declare output integer
  # Output integer will take on different values as we loop over the string and
# Algorithm
  # Helper method returning integer value of input; a numeric CHARACTER
  # Current digit variable starting at integer 1
  # Counter variable starting at 0
  # Loop over the string character using counter as index. At each iteration
    # Call char_to_int
    # Multiply by current digit
    # Add to output integer
    # *= current digit by 10
    # counter += 1
    # Stop when counter is = to string size
  # Return output

def char_to_integer(char)
  case char
    when '0' then 0
    when '1' then 1
    when '2' then 2
    when '3' then 3
    when '4' then 4
    when '5' then 5
    when '6' then 6
    when '7' then 7
    when '8' then 8
    when '9' then 9
  end
end

def string_to_integer(string)
  output = 0
  current_digit = 10 ** (string.size - 1)
  counter = 0
  loop do
    digit = char_to_integer(string[counter])
    output += digit * current_digit
    current_digit /= 10
    counter += 1
    break if counter == string.size
  end
  output
end

# Examples

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
p string_to_integer('570') == 570


# Using a hash probably much easier way to do this, let's try that with the further exploration

# Write a hexadecimal_to_integer method that converts a string representing a hexadecimal number to its integer value.

HEX_DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3,
  '4' => 4, '5' => 5, '6' => 6, '7' => 7,
  '8' => 8, '9' => 9, 'A' => 10, 'B' => 11,
  'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15,
}

def hexadecimal_to_integer(string)
  output = 0
  string.upcase.each_char do |char|
    output = HEX_DIGITS[char] + 16 * output
  end
  output
end

p hexadecimal_to_integer('4D9f')