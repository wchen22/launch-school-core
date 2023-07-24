# Write a method that takes two Arrays as arguments, and returns an Array that contains all of the values from the argument Arrays. There should be no duplication of values in the returned Array, even if there are duplicates in the original Arrays.

def merge(arr1, arr2)
  (arr1 + arr2).uniq
end

def merge(arr1, arr2)
  arr1 | arr2
end

# This one mutates arr1
def merge(arr1, arr2)
  arr2.each {|ele| arr1 << ele if (arr1.any?(ele) == false)}
  arr1
end

# Example

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
