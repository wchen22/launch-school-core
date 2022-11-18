# Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.

# Examples:

def running_total(array)
  running_totals = []
  current_total = 0
  array.each do |n| 
    current_total += n
    running_totals << current_total
  end
  running_totals
end

def running_total(array)
  array.map.with_index { |n, i| array[0..i].sum }
end

# Try solving this problem using Enumerable#each_with_object or Enumerable#inject (note that Enumerable methods can be applied to Arrays).

def running_total(array)
  sum = 0
  array.each_with_object([]) {|n, running_totals| running_totals << sum += n }
end

def running_total(array)
  running_totals = []
  array.each_with_index { |n, i| running_totals << array[0..i].inject(:+)}
  running_totals
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

# A running total is the sum of all values in a list up to an including the current element. Thus, the running total when looking at index 2 of the array [14, 11, 7, 15, 20] is 32 (14 + 11 + 7), while the running total at index 3 is 47 (14 + 11 + 7 + 15).

