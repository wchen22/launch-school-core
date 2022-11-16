# Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

# Examples:
# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 17
# The number 17 appears in [25, 15, 20, 17, 23].


# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 18
# The number 18 does not appear in [25, 15, 20, 17, 23].

inputs = []
nth_arr = %w(1st 2nd 3rd 4th 5th last)
nth_arr.each do |nth|
  puts "==> Enter the #{nth} number:"
  inputs << gets.chomp
end

first_five = inputs[0,5]
last = inputs.last
appears = first_five.include?(last) ? "appears" : "does not appear"
puts "The number #{last} #{appears} in #{first_five}."
