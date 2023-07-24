# What happens when we modify an array while we are iterating over it? What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# each should rely on the index to iterate, so we would print 1, 3


# What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# 1, 2

# The lesson: "In both cases we see that iterators DO NOT work on a copy of the original array or from stale meta-data (length) about the array. They operate on the original array in real time."