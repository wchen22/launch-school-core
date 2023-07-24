# Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

# Example:
# repeat('Hello', 3)

# Output:

# Hello
# Hello
# Hello

# Problem (Understand)
  # Inputs: string and positive integer
  # Outputs: string printed integer times
  # Explicit: method should be called repeat
  # Implicit:  
    # repeat takes a string arg and an integer arg
    # string should be printed on a new line each time
  # Questions:
    # What should the method return if the arguments aren't a string and integer?
# Example/Test Casees
  # repeat('Hello', 3)
  # => Hello
  # => Hello
  # => Hello
  # repeat('asdf', 1)
  # => asdf
  # repeat('hi',0)
  # nothing should happen
# Data Structure
  # No need for a collection here, we can work on the passed in string and integer as they are
# Algorithm
  # repeat(string, i)
  # i number of times loop
  # print string on a line

def repeat(string, reps)
  reps.times do
    puts string
  end
end

repeat('Hello', 3)
repeat('asdf', 1)
repeat('hi', 0)
repeat('', 2)
