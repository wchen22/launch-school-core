# A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

# Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Return an error message if there is no next featured number.

def featured(number)
  error_msg = "There is no possible number that fulfills those requirements"
  return error_msg if number > 9_876_543_200

  if number % 7 == 0
    number += 7
    number += 7 until number.odd? && number.digits.size == number.digits.uniq.size
  else
    number += 1 until number % 7 == 0
    number +=7 until number.odd? && number.digits.size == number.digits.uniq.size
  end

  number
end

# Examples:

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987
p featured(9_876_543_200)
p featured(9_876_543_201)
p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
