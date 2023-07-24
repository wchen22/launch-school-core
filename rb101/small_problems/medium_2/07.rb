# Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.

require 'date'

def friday_13th(year)
  count = 0
  1.upto(12) do |month|
    count += 1 if Date.new(year, month, 13).wday == 5 # there's also a friday? method
  end
  count
end

# Examples:

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

# Further Exploration
# An interesting variation on this problem is to count the number of months that have five Fridays. This one is harder than it sounds since you must account for leap years.

# Problem
  # Input: year
  # Output: integer count representing months with five Fridays
  # Implicit:
    # Months can be 28, 29, 30, 31 days long
    # 28: Can't have 5 Fridays
    # 29: First day of month is Friday
    # 30: First day of month is Thursday-Friday
    # 31: First day of month is Wed-Fri
# Examples / Test cases
  # See below
# Data Structure
  # Count months starting at 0
  # Taking the input year we create a new Date object 
# Algorithm
  # Iterate over months from 1 to 12
    # Store number of days in month in n_days
    # Create a new date for each month
      # Call.wday on it and store in first_day
    # Case statement n_days
      # 29 then first_day == 5
      # 30 then (4..5).include? first_day
      # 31 then (3..5).include? first_day

def five_fridays(year)
  months = 0

  1.upto(12) do |month|
    n_days = Date.new(year, month, -1).mday
    first_day = Date.new(year, month).wday

    case n_days
    when 29 then months += 1 if first_day == 5
    when 30 then months +=1 if (4..5).include?(first_day)
    when 31 then months +=1 if (3..5).include?(first_day)
    end

  end
  months
end

p five_fridays(2022) == 4
p five_fridays(2027) == 5
p five_fridays(2026) == 4
