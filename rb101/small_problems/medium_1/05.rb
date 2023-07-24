# Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.

def diamond(n)
  puts
  blank_count = (n - 1) / 2
  star_count = 1
  1.upto(n) do |i|
    output = ' ' * blank_count + '*' * star_count

    puts output
    
    if i <= n / 2
      blank_count -= 1
      star_count += 2
    else
      blank_count += 1
      star_count -= 2
    end
  end
end


# Examples

diamond(1)

# *

diamond(3)

#  *
# ***
#  *

diamond(9)

#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *

# Further Exploration
# Try modifying your solution or our solution so it prints only the outline of the diamond