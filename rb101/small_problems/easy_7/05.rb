# Write a method that takes a String as an argument, and returns a new String that contains the original value using a staggered capitalization scheme in which every other character is capitalized, and the remaining characters are lowercase. Characters that are not letters should not be changed, but count as characters when switching between upper and lowercase.

def staggered_case(string)
  string.chars.map.with_index{ |char, i| i.even? ? char.upcase : char.downcase }.join
end


# Example:

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# Further Exploration

# Can you modify this method so the caller can request that the first character be downcased rather than upcased? If the first character is downcased, then the second character should be upcased, and so on.

def staggered_case(string, first_upper = 0)
  string.chars.map.with_index{ |char, i| i%2 == first_upper ? char.upcase : char.downcase }.join
end

p staggered_case('I Love Launch School!')
p staggered_case('I Love Launch School!', 1)