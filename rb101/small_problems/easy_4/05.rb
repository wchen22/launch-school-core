# Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number, and then computes the sum of those multiples. For instance, if the supplied number is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

# You may assume that the number passed in is an integer greater than 1.

def multisum(integer)
  multiples = []
  1.upto(integer) do |i|
    multiples << i if i % 3 == 0 || i % 5 == 0
  end
  multiples.sum
end

def multisum(integer)
  (1..integer).select {|n| n % 3 == 0 || n % 5 == 0}.sum 
end

# Investigate Enumerable.inject (also known as Enumerable.reduce), How might this method be useful in solving this problem? (Note that Enumerable methods are available when working with Arrays.) Try writing such a solution. Which is clearer? Which is more succinct?

def multisum(integer)
  (1..integer).inject(0) { |sum, n| n % 3 == 0 || n % 5 == 0 ? sum + n : sum}
end

# Examples

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
