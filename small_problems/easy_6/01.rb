# # Write a method that takes a floating point number that represents an angle between 0 and 360 degrees and returns a String that represents that angle in degrees, minutes and seconds. You should use a degree symbol (°) to represent degrees, a single quote (') to represent minutes, and a double quote (") to represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

# Note: your results may differ slightly depending on how you round values, but should be within a second or two of the results shown.

# You should use two digit numbers with leading zeros when formatting the minutes and seconds, e.g., 321°03'07".

# You may use this constant to represent the degree symbol:

# DEGREE = "\xC2\xB0"

# Problem
  # Input: a floating point number between 0 and 360 degrees representing an angle
  # Output: String representing angle in degrees, minutes, seconds
  # Explicit requirements
    # Degree has 60 minutes
    # Minute has 60 seconds
    # Use two digit numbers with leading zeros for minutes and seconds
    # Use constant DEGREE = "\xC2\xB0" to represent degree symbol
  # Implicit reqs
    # %(dd°mm'ss")
    # Input float can have different numbers of significant digits
    # Degrees do not have to have leading zeros
    # 360 can be either 360 degrees or 0 degrees
    # 0 should be just 0 degrees
# Examples/Test Cases
  # p dms(30) == %(30°00'00")
  # p dms(76.73) == %(76°43'48")
  # p dms(254.6) == %(254°36'00")
  # p dms(93.034773) == %(93°02'05")
  # p dms(0) == %(0°00'00")
  # p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
# Data Structure / Algorithms
  # Declare function dms that takes a float
  # Declare DEGREE = "\xC2\xB0"
  # Declare an output string "%("
  # From input float, store the integer part as a degree_int and the fractional part as a float (degree_fraction)
  # Convert the fractional part into minutes and seconds
    # minutes = degree_fraction * 60
    # Store integer part of degrees as minutes_int and the fractional part as a float (minute_fraction)
    # seconds = minute_fraction * 60 
  # Format output string
    # Append the string rep of degree_int as it is, no need to format, along with DEGREE constant
    # Format minutes_int to have up to 2 leading 0's, append along with '
    # Format seconds to have up to 2 leading 0's, append with ")
  # Return the output string

DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def dms(angle)
  total_seconds = (angle * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

# Examples:

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")


# Since degrees are normally restricted to the range 0-360, can you modify the code so it returns a value in the appropriate range when the input is less than 0 or greater than 360?

def dms(angle)
  angle = angle % 360
  total_seconds = (angle * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

p dms(400) == %(40°00'00")
p dms(-40) == %(320°00'00")
p dms(-420) == %(300°00'00")