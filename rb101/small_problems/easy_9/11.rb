# Given the array...

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon', 'blue']

# Write a program that prints out groups of words that are anagrams. Anagrams are words that have the same exact letters in them but in a different order. Your output should look something like this:

# ["demo", "dome", "mode"]
# ["neon", "none"]
#(etc)

# Problem
  # Input: An array of words
  # Output: New arrays printed on one line each containing groups of words from the input that are anagrams
  # Explicit: Anagrams are words with the same exact letters in different orders
  # Implicit: 
    # Words in each anagram group should appear in alphabetic order
    # Words without an anagram in the input array should not be printed 
  # Questions: 
    # How should duplicates be handled? 
      # For the purpose of this exercise let's print duplicates hoewver many times in the order they appear
# Examples/Test Cases
  # See above words array definition
  # => ["demo", "dome", "mode"]
  # => ["neon", "none"]
  # etc.
# Data Structure
  # Start from the input array
  # Declare output array
  # Push into output array new arrays containing anagram groups
# Algorithm
  # Brute force: Go through every word and compare to every other word 
  # Probably better: Go through every word, check REMAINING words in the array for anagrams, push into output array as new array, remove all those words 
    # Want to make sure we don't iterate over the array as we're moving anagram groups to avoid looping errors
    # Can use a while loop with condition that array is not empty
  # Method: check if two words are anagrams

  # Initialize output array
  # Initialize a while loop, set condition to input words array is not empty
    # Set current_word = first element of the words array
    # Initialize an anagrams array with current_word as first element
    # Iterate through the rest of the array (not including first element) and call anagrams? on the current_word and each array word
      # If anagrams? is true, push the current iterated word into anagrams
    # Set words = to words - anagrams
    # Push anagrams into output
    # Print the array representation of all anagram groups in the output array if their size is > 1

def anagram?(word1, word2)
  word1.chars.sort == word2.chars.sort
end

def group_anagrams(all_words)
  groups = []

  while !all_words.empty?
    current_word = all_words[0]
    current_anagrams = [current_word]

    all_words[1..].each do |word|
      current_anagrams << word if anagram?(current_word, word)
    end

    all_words = all_words - current_anagrams
    groups << current_anagrams
  end

  groups
end

def print_anagram_groups(words)
  groups = group_anagrams(words)
  groups.select! { |group| group.size > 1}
  groups.map! { |group| group.sort}
  groups.each { |group| p group}
end

#print_anagram_groups(words)

# Much easier way to do with a hash

result = {}

words.each do |word|
  key = word.split('').sort.join

  if result.has_key?(key)
    result[key] << word
  else
    result[key] = [word]
  end

end

result.each_value do |group|
  p group.sort
end
