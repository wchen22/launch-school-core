# As seen in the previous exercise, the time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

# Write two methods that each take a time of day in 24 hour format, and return the number of minutes before and after midnight, respectively. Both methods should return a value in the range 0..1439.

# You may not use ruby's Date and Time methods.

# Examples:

def after_midnight(hours_minutes)
  hours, minutes = hours_minutes.split(':').map(&:to_i)
  minutes_after = hours * 60 + minutes
  minutes_after == 1440 ? 0 : minutes_after
end

def before_midnight(hours_minutes)
  minutes_before = 1440 - after_midnight(hours_minutes)
  minutes_before == 1440 ? 0 : minutes_before
end

# Further Exploration
# How would these methods change if you were allowed to use the Date and Time classes?


p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0

# Yes, we know that 24:00 isn't a valid time in 24-hour format. Humor us, though; it makes the problem more interesting.

# Disregard Daylight Savings and Standard Time and other irregularities.