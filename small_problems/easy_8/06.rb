# Write a method that takes two arguments: the first is the starting number, and the second is the ending number. Print out all numbers from the starting number to the ending number, except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

# Example:

def fizzbuzz(start, total_numbers)
  output = []
  start.upto(total_numbers) do |i|
    if i % 3 == 0 && i % 5 == 0
      output << "FizzBuzz"
    elsif i % 3 == 0
      output << "Fizz"
    elsif i % 5 == 0
      output << "Buzz"
    else
      output << i
    end
  end
  print output.join(', ')
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

