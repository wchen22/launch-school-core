# Write a method that displays an 8-pointed star in an nxn grid, where n is an odd integer that is supplied as an argument to the method. The smallest such star you need to handle is a 7x7 grid.

# Examples

# star(7)

# *  *  *  Spaces are 2 wide or (n-3)/2
#  * * *   1 wide
#   ***    0 wide
# *******
#   ***
#  * * *
# *  *  *

# star(9)

# *   *   *
#  *  *  *
#   * * *
#    ***
# *********
#    ***
#   * * *
#  *  *  *
# *   *   *

def star(n)
  spaces = (n-3) / 2

  spaces.downto(0) do |i|
    puts (['*'] * 3 ).join(' ' * i).center(n)
  end

  puts '*' * n

  0.upto(spaces) do |i|
    puts (['*'] * 3 ).join(' ' * i).center(n)
  end
end

star(7)
star(9)