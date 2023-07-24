# In the previous exercise, we developed a procedural method for computing the value of the nth Fibonacci numbers. This method was really fast, computing the 20899 digit 100,001st Fibonacci sequence almost instantly.

# In this exercise, you are going to compute a method that returns the last digit of the nth Fibonacci number.

def fibonacci(n)
  first, last = [1, 1]
  3.upto(n) do
    first, last = [last, (first + last) % 10] # Only ever need the last digit, so this reduces the number of calculations needed
  end

  last
end

def fibonacci_last(n)
  fibonacci(n).to_s[-1].to_i
end

# Examples:

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
# p fibonacci_last(123456789) # -> 4

# Further Exploration
# After a while, even this method starts to take too long to compute results. Can you provide a solution to this problem that will work no matter how big the number? You should be able to return results almost instantly. For example, the 123,456,789,987,745th Fibonacci number ends in 5.

# Seems like the last digits repeat every 60 numbers, so that 61st, 62nd, 63rd numbers end in 1, 1, 2...

def fibonacci_last(n)
  fibonacci(n % 60).to_s[-1].to_i
end

p fibonacci_last(123456789) # -> 4
