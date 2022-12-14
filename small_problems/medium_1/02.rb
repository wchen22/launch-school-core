# Write a method that can rotate the last n digits of a number. For example:

# Note that rotating just 1 digit results in the original number being returned.

# You may use the rotate_array method from the previous exercise if you want. (Recommended!)

# You may assume that n is always a positive integer.

def rotate_array(array)
  array[1..] + [array[0]]
end

def rotate_rightmost_digits(number, digits)
  rotate_index = number.to_s.size - digits
  first = number.to_s[0...rotate_index]
  second = number.to_s[rotate_index..]
  rotated = first + rotate_array(second.chars).join
  rotated.to_i
end

# LS solution: let's work with arrays from the beginning

def rotate_rightmost_digits(number, digits)
  all_digits = number.to_s.chars
  all_digits[-digits..] = rotate_array(all_digits[-digits..])
  all_digits.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
