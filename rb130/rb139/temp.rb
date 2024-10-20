# names = %w(John Amy Sam)
# backward_names = names.map {|name| name.reverse} # => ["nhoJ", "ymA", "maS"]
# p backward_names

# def square (num)
#   answer = num * num
#   yield(answer) if block_given?
# end

# square(4)
# square(4) { |answer| puts answer } # => outputs 16

# def call_by_yield
#   yield if block_given?
# end

# call_by_yield { puts "This happens when I'm yielded to"}


# def call_by_call(&block)
#   block.call
# end

# call_by_call { puts "This happens when I'm called" }

# def return_three_things(array)
#   yield(array)
# end

# return_three_things([1,2]) {|a, b, c| p [a, b, c]} # => [1, 2, nil]
# return_three_things([1,2,3]) {|a, b, c| p [a, b, c]} # => [1, 2, 3]
# return_three_things([1,2,3,4,5]) {|a, b, c| p [a, b, c]} # => [1, 2, 3]

# p ['a', 'b', 'c', 'd'].map { |element| element.to_sym }
# p ['a', 'b', 'c', 'd'].map(&:to_sym) 

# ['a', 'b', 'c', 'd'].each(&:to_sym)

def yield_negative_and_positive(number)
  yield(number)
  yield(-number)
end

yield_negative_and_positive(10) {|num|puts "#{num}"}

some_array = []
yield_negative_and_positive(10) {|num|some_array << num}
p some_array