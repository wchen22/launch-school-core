# If you take a number like 735291, and rotate it to the left, you get 352917. If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.

# Write a method that takes an integer as argument, and returns the maximum rotation of that argument. You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.

def rotate_array(array)
  array[1..] + [array[0]]
end

def rotate_rightmost_digits(number, digits)
  all_digits = number.to_s.chars
  all_digits[-digits..] = rotate_array(all_digits[-digits..])
  all_digits.join.to_i
end

# Note that you do not have to handle multiple 0s.

def max_rotation(number)
  length = number.digits.size
  (length).downto(2) do |i|
    number = rotate_rightmost_digits(number, i)
  end
  number
end


# Example:

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845


# Further Exploration

# Assume you do not have the rotate_rightmost_digits or rotate_array methods. How would you approach this problem? Would your solution look different? Does this 3 part approach make the problem easier to understand or harder?
  # This 3 part approach definitely makes it easier - we start from the ground up defining what it means to "rotate" a collection, then creating a function to rotate the rightmost n number of digits, then using that logic to maximally rotate a number. 
  # If we didn't have the aforementioned methods, I would probably slice the number using a loop, changing the slice index at each iteration and then applying the rotating logic to the right slice before rejoining it with the left slice.

# There is an edge case in our problem when the number passed in as the argument has multiple consecutive zeros. Can you create a solution that preserves zeros?

  # We could use Ruby's format method, but this would return a string, which we could achieve by returning all_digits.join rather than all_digits.join.to_i

p rotate_rightmost_digits(30045, 5) # => 453
