# How big is the room?
# Build a program that asks a user for the length and width of a room in meters and then displays the area of the room in both square meters and square feet.

# Note: 1 square meter == 10.7639 square feet

# Do not worry about validating the input at this time.

# Example Run

# Enter the length of the room in meters:
# 10
# Enter the width of the room in meters:
# 7
# The area of the room is 70.0 square meters (753.47 square feet).

SQMETERS_TO_SQFEET = 10.7639

puts "Enter the length of the room in meters:"
length = gets.chomp.to_f

puts "Enter the width of the room in meters:"
width = gets.chomp.to_f

area_meters = length * width.round(2)
area_sq_feet = (area_meters * SQMETERS_TO_SQFEET).round(2)
puts "The area of the room is #{area_meters} square meters (#{area_sq_feet} square feet)."


# Modify this program to ask for the input measurements in feet, and display the results in square feet, square inches, and square centimeters.

SQFEET_TO_SQINCHES = 144
SQFEET_TO_SQCM = 929.03

puts "Enter the length of the room in feet"
length = gets.to_f

puts "Enter the width of the room in feet"
width = gets.to_f

area_sq_feet = length * width
area_sq_inches = area_sq_feet * SQFEET_TO_SQINCHES
area_sq_cm = area_sq_feet * SQFEET_TO_SQCM

puts "The area of the room is #{area_sq_feet} square feet " \
      + "(#{area_sq_inches} square inches, #{area_sq_cm} square cm)."