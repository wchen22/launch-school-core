
weights = {
'Rock' => 130,
'Paper' => 15,
'Scissors' => 15,
'Lizard' => 35,
'Spock' => 5
} 

sample_array = []

weights.each do |move, weight|
  sample_array += [move] * weight
end

p sample_array
#p sample_array.sample


# range_start = 0
# weights.each do |key, value|
#   weights[key] = [value, [range_start, range_start + value]]
#   range_start = weights[key][1][1]
# end

# p weights
# p range_start

# puts (1..range_start).to_a.sample

=begin
=> Who would you like to play against today?
1) R2D2 2) HAL 3) Data 4) Tars 5) Wall-E 6) Random 7) Robot with no personality
-> R2D2

# player2 = R2D2.new # Need a create_ai function that does
when "1" then computer = R2D2.new
when "2" then computer = HAL.new

# Each computer subclass has its own weights, which the Computer superclass calls when it does choose_move
=end
