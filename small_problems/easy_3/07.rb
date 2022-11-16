# Write a method that returns an Array that contains every other element of an Array that is passed in as an argument. The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

def oddities(arr)
  counter = 0
  every_other = []
  while counter < arr.size
    every_other << arr[counter]
    counter += 2
  end
  every_other
end

# Write a companion method that returns the 2nd, 4th, 6th, and so on elements of an array.

def evens(arr)
  even_elements = []
  1.upto(arr.size-1) do |i|
    even_elements << arr[i] if i.odd?
  end
  even_elements
end

# Examples:

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p evens([2,3,4,5,6]) == [3, 5]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
p oddities([1, 2, 3, 4, 1]) == [1, 3, 1]

# Try to solve this exercise in at least 2 additional ways.

def oddities(arr)
  every_other = []
  arr.each_with_index do |ele, i|
    every_other << ele if i.even?
  end
  every_other
end

def oddities(arr)
  every_other = []
  1.upto(arr.size) do |i|
    every_other << arr[i-1] if i.odd?
  end
  every_other
end
