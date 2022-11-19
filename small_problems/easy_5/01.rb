# Write a method that determines and returns the ASCII string value of a string that is passed in as an argument. The ASCII string value is the sum of the ASCII values of every character in the string. (You may use String#ord to determine the ASCII value of a character.)

def ascii_value(str)
  str.chars.map { |char| char.ord }.sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

# Further Exploration
# There is an Integer method such that:

# char.ord.mystery == char
# where mystery is our mystery method. Can you determine what method name should be used in place of mystery? What happens if you try this with a longer string instead of a single character?

# char.ord.chr
# with a longer string, #ord only gives us the ascii value of the first character, so char.ord.chr in that case would return us the first character in a string.