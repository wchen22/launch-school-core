# Write a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

def double_consonants(string)
  output = ''
  valid = ('a'..'z').to_a - %w(a e i o u)
  string.each_char do |char|
    output << (valid.include?(char.downcase) ? char * 2 : char)
  end
  output
end


#Examples:

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""