
# Roman Numeral	Value
# I	1
# V	5
# X	10
# L	50
# C	100
# D	500
# M	1000

=begin
Problem
  Given a class which takes as an argument a decimal number, #to_roman should return a string representation of the Roman numeral equivalent of the decimal value
  input: Decimal Number
  output: String
  rules:
    Addition rules
      Up to 3 times for the same one
    Subtractive notation
      smaller number before bigger one deducts it, following it sums it
        only one subtraction for 'operators'
      can only subtract a power of 10, and only from next two higher base numbers
    Start left to right with highest values
  questions/test cases
    
Examples/experimentation
  ideas
  - Work with the base numeral values and work backwards
  - Base values IVXLCDM
  - Then you have the valid subtractive
    I -> IV, IX
    X -> XL, XC
    C -> CD, CM
  -from one power to the next, there is a base numeral representing the midpoint (5*). 3 additions get us the first 3 digits, 1 subtraction gets us the 4th. for 6*-9*, just add another 3/ subtract another 1
  -Pattern
    -Get the digits of the number
    384 = 300 + 80 + 4 = 300 + 50 + 30 + 4
          CCC.  LXXX IV
    4 - base 1: I, V, X
    8 - base 2: X, L, C
    3 - base 3: C, D, M
    could have a function(digit 0-9, place) => Numeral String
      0 - return nothing
      1-3: return 3x first element (I, X, C)
      4-: first+second element
      5: second element
      6-8 second element + function(difference)
      9 second + third


    base 4: M



  3 = III
    - between 1 and 5. IV is the most you can achieve by subtraction, so go the stack route III
  4 = IV
    -between 1 and 5, 1 less than 5.
  5 = V
  6 = VI
  27 = XVII

Data Structures/ Algorithms
-Beginning with the input integer from 0-3000
-Get an array of the digits
-Map this array with the convert(digit, place)
  -convert(digit, place)
    1 => [I V X]
    2 => [X L C]
    3 => [C D M]

    find the right set of numerals

    case digit
      0 ""
      1..3 digit * first
      4 first + second
      5 second
      6-8 second + convert(difference,place)
      9 second + third
  
-Append the map

  -Pattern
    -Get the digits of the number
    384 = 300 + 80 + 4 = 300 + 50 + 30 + 4
          CCC.  LXXX IV
    4 - base 1: I, V, X
    8 - base 2: X, L, C
    3 - base 3: C, D, M
    could have a function(digit 0-9, place) => Numeral String
      0 - return nothing
      1-3: return 3x first element (I, X, C)
      4-: first+second element
      5: second element
      6-8 second element + function(difference)
      9 second + third

      if place is 4, return digit * M


Code
=end
require 'pry'

PLACE_NUMERAL_SET_MAP = {
  1 => %w(I V X),
  2 => %w(X L C),
  3 => %w(C D M),
  4 => %w(M)
}
class RomanNumeral

  def self.convert_digit_to_numeral(digit, place)
    first, second, third = PLACE_NUMERAL_SET_MAP[place]

    case digit
    when 0 then ""
    when 1..3 then first * digit
    when 4 then first + second
    when 5 then second
    when 6..8 then second + self.convert_digit_to_numeral(digit-5, place)
    when 9 then first + third
    end
  end

  def initialize(value)
    @value = value
  end

  def to_roman
    digits = @value.digits.reverse
    digits_to_roman = digits.map.with_index do |digit, index|
      place = digits.size - index
      RomanNumeral::convert_digit_to_numeral(digit, place)
    end

    digits_to_roman.join
  end
end