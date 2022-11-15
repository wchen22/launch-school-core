# Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

# Examples:

# puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
# puts digit_list(7) == [7]                     # => true
# puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
# puts digit_list(444) == [4, 4, 4]             # => true

def digit_list(pos_int)
  pos_int.digits.reverse
  # pos_int.to_s.chars.map(&:to_i)
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

# Let's try PEDAC with a brute force approach

# Problem
  # Input: A positive integer
  # Output: A list of the digits in the number
  # Explicit: Method name is digit_list and takes a one positive integer as an argument
  # Implicit: 
    # Digits are returned as integers in an array
    # Digits in the array are ordered the same as the number
  # Questions: How should we handle invalid argument input?
# Examples/Test Cases
  # puts digit_list(12345) => [1, 2, 3, 4, 5]     
  # puts digit_list(7) => [7]                    
  # puts digit_list(375290) => [3, 7, 5, 2, 9, 0] 
  # puts digit_list(444) => [4, 4, 4]             
# Data Structure
  # Input is an integer
  # Output is an array of integers
  # Can take advantage of string indexing to capture integers one-by-one. Would have to convert the input to a string, extract the letters, then convert them back to integers.
  # If we leave as an integer, we have to take the remainder of the number divided by 10, then by 100, then 1000, and so forth until the next power of 10 is greater than the number
# Algorithm
  # Pseudocode
    # Declare a method digit_list_brute that takes an integer
    # Declare an empty array digits
    # Set current number equal to passed number
    # Loop
      # Divide current number by 10 and find the remainder
      # Push this remainder into the front of digits
      # Update the number variable to the (number - remainder) / 10
      # Stop when next power of 10 is greater than the updated number
    # Push the remaining current_number to front of digits array
    # Return the array

def digit_list_brute(int)
  digits = []
  current_number = int
  loop do
    remainder = current_number % 10
    digits.unshift(remainder)
    current_number = (current_number - remainder) / 10
    break if 10 > current_number
  end
  digits.unshift(current_number)
  digits
end

p digit_list_brute(444)



