# Write a method that returns the next to last word in the String passed to it as an argument.

# Words are any sequence of non-blank characters.

# You may assume that the input String will always contain at least two words.

def penultimate(string)
  string.split[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

# Our solution ignored a couple of edge cases because we explicitly stated that you didn't have to handle them: strings that contain just one word, and strings that contain no words.

# Suppose we need a method that retrieves the middle word of a phrase/sentence. What edge cases need to be considered? How would you handle those edge cases without ignoring them? Write a method that returns the middle word of a phrase or sentence. It should handle all of the edge cases you thought of.
  # Blank string: Return nil
  # Single word : Return the word
  # Even number of words: Return the first middle word

def middle(string)
  words = string.split
  index = words.size / 2
  index.even? ? words[index-1] : words[index]
end

p middle("Hello there Bob")
p middle("")
p middle("Hello")
p middle("Hello there, good morning")