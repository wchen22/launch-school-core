# Write a program that reads the content of a text file and then prints the longest sentence in the file based on number of words. Sentences may end with periods (.), exclamation points (!), or question marks (?). Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word. You should also print the number of words in the longest sentence.

# Example text stored in 01.txt

# The longest sentence in the above text is the last sentence; it is 86 words long. (Note that each -- counts as a word.)

# Another Example

# Download the book at http://www.gutenberg.org/cache/epub/84/pg84.txt, and run your program on this file.

# The longest sentence in this book is 157 words long.

file_data = File.read("01.txt").split.join(' ')

sentences = file_data.split(/[.!?]/)

longest = sentences.max{|a, b| a.length <=> b.length}.split.join(' ')

p longest.split.size



file_data = File.read("pg84.txt").split.join(' ')

sentences = file_data.split(/[.!?]/)

longest = sentences.max{|a, b| a.length <=> b.length}.split.join(' ')

p longest
p longest.split.size


# You may have noticed that our solution fails to print the period at the end of the sentence. Can you write a solution that keeps the period printed at the end of each sentence?

def longest_with_period(text)
  longest_sentence = ""
  longest_length = 0
  current_sentence = ''
  text.split.each do |word|
    current_sentence << word << ' '
    if %w(. ! ?).include?(word[-1])
      if current_sentence.length > longest_length
        longest_sentence = current_sentence
        longest_length = longest_sentence.size
        current_sentence = ''
      else current_sentence = ''
      end
    end
  end
  longest_sentence.strip
end

p longest_with_period(file_data)


# What about finding the longest paragraph or longest word? How would we go about solving that problem?

# We could use \n as a delimiter for longest paragraph
# For longest word, we presumably want just alphabetical characters. We could split by ' ', then map each element to the :split function, passing it a regex argument of all non-alphabetic characters before finding the longest one. 

