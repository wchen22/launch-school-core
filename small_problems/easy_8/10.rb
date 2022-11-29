# Write a method that takes a non-empty string argument, and returns the middle character or characters of the argument. If the argument has an odd length, you should return exactly one character. If the argument has an even length, you should return exactly two characters.

# length 7, index 3 / 2
# length 8, index 3 and 4 /2, /2.ceil

def center_of(string)
  length = string.length
  if length.even?
    string[length/2 - 1, 2]
  else
    string[length/2]
  end
end


# Examples:

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch')  == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'