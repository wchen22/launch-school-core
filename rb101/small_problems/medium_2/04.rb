# Matching Parentheses?
# Write a method that takes a string as an argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

def balanced?(string)
  open_indices = string.chars.map.with_index { |char, i| char == '(' ? i : nil}.select { |i| i != nil}
  closed_indices = string.chars.map.with_index { |char, i| char == ')' ? i : nil}.select { |i| i != nil}
  return false if open_indices.size != closed_indices.size
  open_indices.each_with_index do |index, i|
    return false if index > closed_indices[i]
  end
  true
end

# Much simpler LS solution uses a count and returns false if that count ever goes below 0

def balanced?(string)
  parens = 0
  string.each_char do |char|
    parens += 1 if char == '('
    parens -= 1 if char == ')'
    return false if parens < 0
  end
  
  parens.zero?
end
# Examples:

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false

# Note that balanced pairs must each start with a (, not a ).


# Further Exploration
# There are a few other characters that should be matching as well. Square brackets and curly brackets normally come in pairs. Quotation marks(single and double) also typically come in pairs and should be balanced. Can you expand this method to take into account those characters?

def balanced?(string, first, second)
  tally = 0
  string.each_char do |char|
    tally += 1 if char == first
    tally -= 1 if char == second
    return false if tally < 0
  end
  
  tally.zero?
end

def all_balanced?(string)
  balanced?(string, '(', ')') &&
  balanced?(string, '{', '}') &&
  balanced?(string, '[', ']') &&
  string.count('"').even? &&
  string.count("'").even?
end

p all_balanced?("([{''}])")