factorial = Enumerator.new do |y|
  current = 0
  start = 1
  loop do
    y << start
    start *= (current +1)
    current += 1
  end
end

p factorial.take(10)

6.times {|number| puts "#{number}! == #{factorial.next}"}

factorial.each_with_index do |value, number|
  puts "#{number}! == #{value}"
  break if number >= 6
end