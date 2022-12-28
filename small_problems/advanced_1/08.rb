# Sort an array of passed in values using merge sort. You can assume that this array may contain only one type of data. And that data may be either all numbers or all strings.

# Merge sort is a recursive sorting algorithm that works by breaking down the array elements into nested sub-arrays, then recombining those nested sub-arrays in sorted order. It is best shown by example. For instance, let's merge sort the array [9,5,7,1]. Breaking this down into nested sub-arrays, we get:

# [9, 5, 7, 1] ->
# [[9, 5], [7, 1]] ->
# [[[9], [5]], [[7], [1]]]
# We then work our way back to a flat array by merging each pair of nested sub-arrays:

# [[[9], [5]], [[7], [1]]] ->
# [[5, 9], [1, 7]] ->
# [1, 5, 7, 9]


def merge_sort(array)
  p array
  n = array.size
  return array if n == 1

  arr1 = array[0...(n/2)]
  arr2 = array[n/2...n]

  arr1 = merge_sort(arr1)
  arr2 = merge_sort(arr2)

  return merge(arr1, arr2)
end

def merge(arr1, arr2)
  p "merging #{arr1} and #{arr2}"
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

p 'asdf'
p merge_sort([9, 5, 7, 1]) #== [1, 5, 7, 9]
p 'fdsa'
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
