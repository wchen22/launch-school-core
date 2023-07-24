require 'pry'
require 'pry-byebug'

def select_nums(arr)
  new_arr = []
  arr.each do |num|
    binding.pry
    new_arr << num if num.odd? && num <= 15 || num % 3 == 0
  end
  new_arr
end

p select_nums([1,2,5,6,9,12,15,17,19,21]) == [1,5,9,15,21]