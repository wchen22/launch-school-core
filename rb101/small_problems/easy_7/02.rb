# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that are neither.

def letter_case_count(string)
  hsh = {
    lowercase: 0,
    uppercase: 0,
    neither: 0
  }
  string.each_char do |char|
    if ('a'..'z').include?(char)
      hsh[:lowercase] += 1
    elsif char =~ /[A-Z]/ # Relying on truthiness - String#=~ returns the index of the first substring matching the regex, nil otherwise
      hsh[:uppercase] += 1
    else
      hsh[:neither] += 1
    end
  end
  hsh
end

def letter_case_count(string)
  counts = {}
  characters = string.chars
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^a-zA-Z]/ }
  counts
end

# Examples

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }