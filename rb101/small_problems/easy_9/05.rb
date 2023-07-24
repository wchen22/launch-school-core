# Write a method that takes a string argument, and returns true if all of the alphabetic characters inside the string are uppercase, false otherwise. Characters that are not alphabetic should be ignored.

def uppercase?(string)
  string.upcase == string
end

# Examples:

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

# Further Exploration
# Food for thought: in our examples, we show that uppercase? should return true if the argument is an empty string. Would it make sense to return false instead? Why or why not?

  # One could argue that a blank string doesn't have any uppercase characters, so the method should return false. We could fix it as such: 

def uppercase?(string)
  string.upcase == string && string != ''
end

p uppercase?('') == false
