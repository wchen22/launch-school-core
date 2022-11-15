# Write a method that takes one argument, a string, and returns a new string with the words in reverse order.

# Problem
  # Input: One argument a string
  # Output: A new string with words in reverse order
# Examples
  # puts reverse_sentence('Hello World') == 'World Hello'
  # puts reverse_sentence('Reverse these words') == 'words these Reverse'
  # puts reverse_sentence('') == ''
  # puts reverse_sentence('    ') == '' # Any number of spaces results in ''
# Data Structure
  # We need to extract all the words in the string to an array, transform the array so that it's reversed, then join them as a new string
# Algorithm
  # Store the words of the string in an array
  # Reverse the array
  # Return the array elements joined with a space

# These tests should print true.

def reverse_sentence(string)
  string.split.reverse.join(' ')
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''

