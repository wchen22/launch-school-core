# Write a method that takes a year as input and returns the century. The return value should be a string that begins with the century number, and ends with st, nd, rd, or th as appropriate for that number.

# New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

# Problem
  # Input: an integer for a year
  # Output: a string with century number and suffix
  # Explicit requirements: 
    # Output string begins with the century number
    # Output ends with either 'st' 'nd' 'rd' or 'th'
  # Implicit requirements:
    # ? Input is a positive integer
    # String suffix will vary as such:
      # Number ends in => Suffix
      # 0 => th
      # 1 => st
      # 2 => nd
      # 3 => rd
      # 4-9 => th
      # EXCEPTIONS: teenths
      # 11-19 => th
# Examples/Test Cases
  # p century(2000) == '20th'
  # p century(2001) == '21st'
  # p century(1965) == '20th'
  # p century(256) == '3rd'
  # p century(5) == '1st'
  # p century(10103) == '102nd'
  # p century(1052) == '11th'
  # p century(1127) == '12th'
  # p century(11201) == '113th'
# Data Structure
  # Input is an integer representing the year
  # Output is a string with a number and suffix portion
    # Number portion is the year / 100 + 1 UNLESS the year is the final one of the century (*00)
# Algorithm
  # Declare method century(year)
    # Call append_suffix on century_from_year(year)
  # Helper method century_from_year
    # New variable century_number, assign it to year / 100
    # Add 1 to century_number UNLESS it's the final year of the century
      # check using year.to_s.ends_with?('00')
    # Return century_number
  # Method: append_suffix the century_number to corresponding suffix
    # If century_number's last two digits from 11 to 19 => 'th'
    # Else if century_number ends in 0, 4-9 => 'th'
    # Else if ends in 1 => 'st'
    # Else if ends in 2 => 'nd'
    # Else if ends in 3 => 'rd'
    # Return concatenated string

# This could use some refactoring

def century_from_year(year)
  century_number = year / 100
  century_number += 1 unless year.to_s.end_with?('00')
  century_number
end

def append_suffix(century)
  return century.to_s + 'th' if (11..19).include?(century.to_s[-2,2].to_i)
  last_digit = century.digits.first
  return case last_digit
  when 1
    century.to_s + 'st'
  when 2
    century.to_s + 'nd'
  when 3
    century.to_s + 'rd'
  else
    century.to_s + 'th' 
  end
end

def century(year)
  append_suffix(century_from_year(year))
end

# Examples:
p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'