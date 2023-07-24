# Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or lowercase each letter. The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.

def staggered_case(string)
  output = ''
  capitalize = true
  string.each_char do |char|
    if char =~ /[A-Z]/i
      output << (capitalize == true ? char.upcase : char.downcase)
      capitalize = !capitalize
    else output << char
    end
  end
  output
end

# Example:

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# Further Exploration
# Modify this method so the caller can determine whether non-alphabetic characters should be counted when determining the upper/lowercase state. That is, you want a method that can perform the same actions that this method does, or operates like the previous version.

def staggered_case(string, non_alpha = false)
  output = ''
  capitalize = true
  string.each_char do |char|
    if char =~ /[^a-zA-Z]/
      output << char
      capitalize = !capitalize if non_alpha
    else
      if capitalize
        output << char.upcase
      else 
        output << char.downcase
      end
      capitalize = !capitalize
    end
  end
  output
end

p staggered_case('I Love Launch School!')
p staggered_case('I Love Launch School!', true)
