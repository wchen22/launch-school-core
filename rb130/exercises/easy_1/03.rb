# Write a method that takes a sorted array of integers as an argument, and returns an array that includes all of the missing integers (in order) between the first and last elements of the argument.

def missing(array)
  missing = []

  array.first.upto(array.last) do |n|
    missing << n unless array.include?(n)
  end

  missing
end

# Examples:

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []


# # Further Exploration
# Can you find other ways to solve this problem? What methods might prove useful? Can you find a way to solve this without using a method that requires a block?

# Without a block: for loop starting at first element, ending in last element

def missing(array)
  missing = []

  for i in (array.first..array.last)
    missing << i unless array.include?(i)
  end

  missing
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

# Array#select

def missing(array)
  missing = (array.first..array.last).to_a.select {|num| !array.include? num}
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
