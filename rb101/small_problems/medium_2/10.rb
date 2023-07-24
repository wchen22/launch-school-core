# Write a method that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.

def sum_square_difference(n)
  square_of_sum = (1..n).sum ** 2
  sum_of_squares = (1..n).inject { |sum, i| sum + i ** 2 }
  # sum_of_squares = (1..n).to_a.map { |i| i ** 2 }.sum
  square_of_sum - sum_of_squares
end

# Examples:

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
