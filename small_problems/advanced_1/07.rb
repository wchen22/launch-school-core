# Write a method that takes two sorted Arrays as arguments, and returns a new Array that contains all elements from both arguments in sorted order.

# You may not provide any solution that requires you to sort the result array. You must build the result array one element at a time in the proper order.

# Your solution should not mutate the input arrays.

def merge(arr1, arr2)
  new_arr = []
  i1 = 0
  i2 = 0

  loop do
    if arr1[i1].nil?
      new_arr << arr2[i2..]
      break
    elsif arr2[i2].nil?
      new_arr << arr1[i1..]
      break
    elsif arr1[i1] < arr2[i2]
      new_arr << arr1[i1]
      i1 += 1
    else
      new_arr << arr2[i2]
      i2 += 1
    end
  end

  new_arr.flatten
end

# Examples:

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
p merge([3],[2])