# Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.

# You may not use String#swapcase; write your own version of this method.

def swapcase(string)
  output = ''
  string.each_char do |char|
    if char =~ /[a-z]/
      output << char.upcase
    else
      output << char.downcase # could add an additional clause separating capital letters and all other characters, but downcase works for non-alphabetic characters since it just returns the same character.
    end
  end
  output
end

# Example:

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'