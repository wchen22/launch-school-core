# Lettercase Percentage Ratio
# In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, as well as characters that were neither of those two. Now we want to go one step further.

# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

# You may assume that the string will always contain at least one character.

# Examples

def letter_percentages(string)
  lower_count = string.count( ('a'..'z').to_a.join )
  upper_count = string.count( ('A'..'Z').to_a.join )
  neither = string.size - lower_count - upper_count
  {
    lowercase: 100.0 * lower_count / string.size,
    uppercase: 100.0 * upper_count / string.size,
    neither: 100.0 * neither / string.size
  }
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

# Further Exploration
# If we passed a string 'abcdefGHI' as an argument to our method call the solution would be {:lowercase=>66.66666666666666, :uppercase=>33.33333333333333, :neither=>0.0}. It would be nicer if we could round these float numbers so that our solution looks like this {:lowercase=>66.7, :uppercase=>33.3, :neither=>0.0}. Try creating that solution on your own.

def letter_percentages(string)
  lower_count = string.count( ('a'..'z').to_a.join )
  upper_count = string.count( ('A'..'Z').to_a.join )
  neither = string.size - lower_count - upper_count
  {
    lowercase: (100.0 * lower_count / string.size).round(1) ,
    uppercase: (100.0 * upper_count / string.size).round(1) ,
    neither: (100.0 * neither / string.size).round(1)
  }
end

p letter_percentages('abcdefGHI')