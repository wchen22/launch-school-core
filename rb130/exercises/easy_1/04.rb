# Divisors
# Write a method that returns a list of all of the divisors of the positive integer passed in as an argument. The return value can be in any sequence you wish.

def divisors(num)
  result = [num]
  1.upto(num/2) do |num2|
    result << num2 if num % num2 == 0
  end
  result.sort
end

# Examples

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
#p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

# How fast can you make your solution go? How big of a number can you quickly reduce to its divisors? Can you make divisors(999962000357) return almost instantly? (The divisors are [1, 999979, 999983, 999962000357].) Hint: half of the divisors gives you the other half.

def divisors(num)
  num_square_root = num ** 0.5
  first_half = 1.upto(num_square_root).select do |candidate|
    num % candidate == 0
  end

  second_half = first_half.map {|divisor| num / divisor}
  (first_half + second_half).uniq.sort
end

p divisors(16)
p divisors(999962000357)