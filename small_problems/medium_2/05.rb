# Triangle Sides
# A triangle is classified as follows:

# equilateral All 3 sides are of equal length
# isosceles 2 sides are of equal length, while the 3rd is different
# scalene All 3 sides are of different length
# To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

# Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

# Problem
  # Input
    # 3 numbers representing the lengths of a triangle
  # Output 
    # A symbol representing if the lengths form an :equilateral, :isosceles, :scalene, or :invalid triangle
  # Questions
    # Will there ever be 0 or negative values entered for a side?
      # We can just have those return :invalid
# Examples / Test Cases
  # triangle(3, 3, 3) == :equilateral
  # triangle(3, 3, 1.5) #== :isosceles
  # triangle(3, 4, 5) == :scalene
  # triangle(0, 3, 3) == :invalid
  # triangle(3, 1, 1) == :invalid

# Data Structure
  # Storing the arguments in an array could be useful for calling min, max, uniq
# Algorithm
  # Store sides in array
    # Sort them from smallest to largest
  # Return :invalid if any of the sides <= 0
  # Return :invalid if the two shortest sides are <= the longest side
    # sides[0..1] <= sides[2]
  # Return :equilateral if sides.uniq is 1
  # Return :isosceles if sides.uniq is 2
  # Return :scalene otherwise

def triangle(s1, s2, s3)
  sides = [s1, s2, s3].sort
  if sides.any? { |side| side <= 0} ||  sides[0..1].sum <= sides[2]
    return :invalid
  elsif sides.uniq.size == 1
    return :equilateral
  elsif sides.uniq.size == 2
    return :isosceles
  else
    return :scalene
  end
end

# Examples:

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid