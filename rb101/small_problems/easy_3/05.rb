# Using the multiply method from the "Multiplying Two Numbers" problem, write a method that computes the square of its argument (the square is the result of multiplying a number by itself).

# Example:

# square(5) == 25
# square(-8) == 64

def multiply(first, second)
  first * second
end

def square(n)
  multiply(n, n)
end

p square(5)
p square(-8)

# Further Exploration
# What if we wanted to generalize this method to a "power to the n" type method: cubed, to the 4th power, to the 5th, etc. How would we go about doing so while still using the multiply method?

def power(n, p)
  current = 1
  p.times do
    current = multiply(current, n)
  end
  current
end
p power(2, 3)
p power(5, 5)