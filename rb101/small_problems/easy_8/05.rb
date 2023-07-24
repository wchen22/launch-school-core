# Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as it does backwards. The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.

# You may (and should) use the substrings method you wrote in the previous exercise.

# For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.

def leading_substrings(string)
  string.chars.map.with_index { |_, i| string[0..i]}
end

def substrings(string)
  result = []
  0.upto(string.size-1) do |i|
    result << leading_substrings(string[i..-1])
  end
  result.flatten
end

def palindromes(string)
  substrings(string).select do |substring|
    substring.size> 1 && substring == substring.reverse
  end
end

# Examples:

p palindromes('abcd') == []
p palindromes('madam')# == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

# Further Exploration
# Can you modify this method (and/or its predecessors) to ignore non-alphanumeric characters and case? Alphanumeric characters are alphabetic characters(upper and lowercase) and digits.

# Presuming that we want to ignore non-alphanumeric characters such that mad4am is a palindrome, and ignore case such that Madam is a palindrome.

def clean_substring(string)
  string.downcase.gsub(/[^a-z]/, '')
end

def palindromes(string)
  substrings(string).select do |substring|
    clean_substring = clean_substring(substring)
    clean_substring.size> 1 && clean_substring == clean_substring.reverse
  end
end

p palindromes('hello-mad4am-did-madam-goodbye') 
