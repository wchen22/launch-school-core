# Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

# Examples:

# >> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.


# >> Please enter an integer greater than 0:
# 6
# >> Enter 's' to compute the sum, 'p' to compute the product.
# p
# The product of the integers between 1 and 6 is 720.

def prompt(str)
  puts ">> " + str
end

def valid_int?(input)
  input.to_i.to_s == input && input.to_i > 0
end

def valid_prompt?(operation)
  %w(s p).include? operation
end

def print_computation(int, operation)
  if operation == 's'
    total = (1..int).inject(:+)
    puts "The sum of the integers between 1 and #{int} is #{total}."
  elsif operation == 'p'
    total = (1..int).inject(:*)
    puts "The product of the integers between 1 and #{int} is #{total}."
  end
end

integer = ''
loop do
  prompt "Please enter an integer greater than 0:"
  integer = gets.chomp
  if valid_int?(integer)
    integer = integer.to_i
    break
  end
  puts "That doesn't seem to be an integer greater than 0. Please try again."
end

operation = ''
loop do
  prompt "Enter 's' to compute the sum, 'p' to compute the product."
  operation = gets.chomp
  break if valid_prompt?(operation)
  puts "That's not an option, please try again."
end

print_computation(integer, operation)