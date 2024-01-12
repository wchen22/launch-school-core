include Math
require 'pry'

class PerfectNumber
  def self.classify(number)
    raise StandardError.new("Natural numbers only") if number <= 0
    aliquot = self.sum_divisors(number)
    case aliquot
    when (0...number) then "deficient"
    when number then "perfect"
    when (number+1..) then "abundant"
    end
  end

  class << self
    private

    def sum_divisors(number)
      divisors = [1]
      2.upto(sqrt(number)) do |num_to_check|
        divides_evenly = number % num_to_check == 0
        divisors += [num_to_check, number/num_to_check] if divides_evenly
      end
      divisors.uniq.sum
    end
  end
end
