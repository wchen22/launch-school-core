# Write a method that takes an integer argument, and returns an Array of all integers, in sequence, between 1 and the argument.

# You may assume that the argument will always be a valid integer that is greater than 0.

def sequence(integer)
  out = []
  1.upto(integer) { |i| out << i}
  out
end

def sequence(integer)
  out = []
  integer.times { |i| out << i +1 }
  out
end

def sequence(integer)
  (1..integer).each_with_object([]) { |i, arr| arr << i}
end

def sequence(integer)
  (1..integer).to_a
end

# Examples:

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]


# Further Exploration
# Food for thought: what do you think sequence should return if the argument is not greater than 0. For instance, what should you do if the argument is -1? Can you alter your method to handle this case?

# If it's 0, should it just print 0?
# And if it's negative, doing the sequence from the negative number up to -1 is a possible option

def sequence(number)
  if number < 0
    (number..-1).to_a
  else
    (1..number).to_a
  end
end

p sequence(-5) == [-5, -4, -3, -2, -1]
p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]