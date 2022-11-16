# Write a method that returns true if its integer argument is palindromic, false otherwise. A palindromic number reads the same forwards and backwards.

def palindromic_number?(integer)
  integer.to_s.reverse.to_i == integer
end

# Examples:

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true

# Suppose your number begins with one or more 0s. Will your method still work? Why or why not? Is there any way to address this?

# No, 003.to_s becomes "3", so something like 0030 would return true even though it's not a palindrome. 