# Build a program that displays when the user will retire and how many years she has to work till retirement.

# Example:

# What is your age? 30
# At what age would you like to retire? 70

# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!

print "What is your age? "
age = gets.chomp.to_i

print "At what age would you like to retire? "
retirement_age = gets.chomp.to_i

year = Time.now.year
years_remaining = retirement_age - age
retirement_year = year + years_remaining

puts "It's #{year}. You will retire in #{retirement_year}."
puts "You have only #{years_remaining} years of work to go!"