# Write a method that will take a short line of text, and print it within a box.

# Example:

# print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+
# print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+
# You may assume that the input will always fit in your terminal window.

def print_in_box(string)
  inner_width = string.size
  puts "+#{ '-'* (inner_width + 2) }+"
  puts "|#{ ' '* (inner_width + 2) }|"
  puts "| #{string} |"
  puts "|#{ ' '* (inner_width + 2) }|"
  puts "+#{ '-'* (inner_width + 2) }+"
end

# print_in_box('To boldly go where no one has gone before.')
# print_in_box('')

# Modify this method so it will truncate the message if it will be too wide to fit inside a standard terminal window (80 columns, including the sides of the box). For a real challenge, try word wrapping very long messages so they appear on multiple lines, but still within a box.

def print_in_box(string)
  all_chars = string.chars
  lines = []
  until all_chars.empty?
    lines << all_chars.shift(80)  
  end

  horizontal_rule = "+#{'-' * (lines[0].size + 2)}+"
  empty_line = "|#{' ' * (lines[0].size + 2)}|"

  puts horizontal_rule
  puts empty_line

  lines.each do |line|
    puts "| #{line.join.center(lines[0].size)} |"
  end

  puts empty_line
  puts horizontal_rule
end

print_in_box('To boldly go where no one has gone before. To boldly go where no one has gone before. To boldly go where no one has gone before. To boldly go where no one has gone before. To boldly go where no one has gone before. To boldly go where no one has gone before. To boldly go where no one has gone before. To boldly go where no one has gone before. To boldly go where no one has gone before. To boldly go where no one has gone before. To boldly go where no one has gone before. To boldly go where no one has gone before. To boldly go where no one has gone before. To boldly go where no one has gone before.')
