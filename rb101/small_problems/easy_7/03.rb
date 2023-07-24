# Write a method that takes a single String argument and returns a new string that contains the original value of the argument with the first character of every word capitalized and all other letters lowercase.

# You may assume that words are any sequence of non-blank characters.

def word_cap(string)
  string.split.map(&:capitalize).join(' ')
end

# Ruby conveniently provides the String#capitalize method to capitalize strings. Without that method, how would you solve this problem? Try to come up with at least two solutions.

def word_cap(string)
  words = string.split
  words.map! do |word|
    word[0].upcase + word[1..-1].downcase
  end
  words.join(' ')
end

def word_cap(string)
  output = ''
  string.each_char.with_index do |char, i|
    if i == 0 || string[i-1] == ' '
      output << char.upcase
    else
      output << char.downcase
    end
  end
  output
end
# Examples

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

