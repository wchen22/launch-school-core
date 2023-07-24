# Right Triangles
# Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

# Examples:

# triangle(5)

#     *
#    **
#   ***
#  ****
# *****

# triangle(9)

#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********

def triangle(stars_per_side)
  row = 1
  stars_per_side.times do
    puts " " * (stars_per_side - row) + "*" * row
    row += 1
  end
end

# triangle(5)
# triangle(9)

# Further Exploration
# Try modifying your solution so it prints the triangle upside down from its current orientation. 

def triangle(size)
  spaces = 0
  size.times do
    puts " " * spaces + "*" * size 
    size -= 1
    spaces += 1
  end
end

# triangle(5)
# triangle(9)

# Try modifying your solution again so that you can display the triangle with the right angle at any corner of the grid.

def triangle(size, corner = 0)
  if corner == 0
    size.downto(1) do |i|
      puts ("*" * i)
    end
  elsif corner == 1
    size.downto(1) do |i|
      puts ("*" * i).rjust(size)
    end
  elsif corner == 2
    1.upto(size) do |i|
      puts ("*" * i).rjust(size)
    end
  elsif corner == 3
    1.upto(size) do |i|
      puts ("*" * i)
    end
  end

end

triangle(5, 0)
triangle(5, 1)
triangle(5, 2)
triangle(5, 3)