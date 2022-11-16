# Palindromic Strings (Part 1)

# Write a method that returns true if the string passed as an argument is a palindrome, false otherwise. A palindrome reads the same forward and backward. For this exercise, case matters as does punctuation and spaces.

def palindrome?(str)
  str.reverse == str
end

# Examples:

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true

# Further Exploration
# Write a method that determines whether an array is palindromic; that is, the element values appear in the same sequence both forwards and backwards in the array. Now write a method that determines whether an array or a string is palindromic; that is, write a method that can take either an array or a string argument, and determines whether that argument is a palindrome. You may not use an if, unless, or case statement or modifier.
# ==> reverse can be used on either arr or string in this situation

def palindromic_array?(arr)
  arr.reverse == arr
end

p palindromic_array?([1, 2, 3, 2, 1])
p palindromic_array?([2, 3, 3, 2])
p palindromic_array?([1, 2, 3, 2])
p palindromic_array?(['M', nil, nil, 'm'])
p palindromic_array?([true, nil, nil, true])

# general purpose method that doesn't use reverse, if, unless, case.

def palindrome_general?(collection)
  reverse = collection.class.new
  reverse_count = collection.size - 1
  loop do
    reverse << collection[reverse_count]
    reverse_count -= 1
    break if reverse_count < 0
  end
  reverse == collection
end

p palindrome_general?('asdffdsa')
p palindrome_general?('asdf')
p palindrome_general?([1, 2, 0, 2, 1])
p palindrome_general?([1, 2, 0, 2, ])








