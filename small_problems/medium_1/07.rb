# # Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

# Example:

WORD_TO_DIGIT = %w(zero one two three four five six seven eight nine).zip(%w(0 1 2 3 4 5 6 7 8 9)).to_h

def word_to_digit(string)
  WORD_TO_DIGIT.each do |word, digit|
    string.gsub!(word, digit)
  end
  string
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# LS solution using regex is better in case we don't want to turn something like 'freight' into 'fr8'.

def word_to_digit(string)
  WORD_TO_DIGIT.keys.each do |word|
    string.gsub!(/\b#{word}\b/i, WORD_TO_DIGIT[word])
  end
  string
end

p word_to_digit('freight Eight one two.')

# Further Exploration
# There are many ways to solve this problem and different varieties of it. Suppose, for instance, that we also want to replace uppercase and capitalized words.

  # Just add 'i' flag after the regex to make it case-insensitive

# Can you change your solution so that the spaces between consecutive numbers are removed? Suppose the string already contains two or more space separated numbers (not words); can you leave those spaces alone, while removing any spaces between numbers that you create?

def to_digit(string) 
  WORD_TO_DIGIT.keys.each do |number_word|
    string.gsub!(/\b#{number_word}\b/i, WORD_TO_DIGIT[number_word])
  end
  string
end

p to_digit('eight')

def word_to_digit(string)
  output = ''
  # This time let's iterate over each of the string's words
  # If it matches the regex, replace it with the value of the hash
    # Push it into an output string
  # If the next value's regex doesn't match the number criteria, add a space
  # Else push the word with a space into output string 
  words = string.split
  words.each_with_index do |word, index|
    output += to_digit(word)
    #output += ' ' unless to_digit(words[index + 1]) != words[index + 1] 
  end
  output.chomp(' ')
end

p word_to_digit('freight eight. eight one  One three 4 5') #== 'freight 8. 8113 4 5'


# What about dealing with phone numbers? Is there any easy way to format the result to account for phone numbers? For our purposes, assume that any 10 digit number is a phone number, and that the proper format should be "(123) 456-7890".

