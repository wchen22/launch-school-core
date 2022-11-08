# What is the result of the last line in the code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# informal_greeting points to the same object as greetings[:a], which is the string 'hi'. We perform String#<< on that object which is mutating, so greetings should be {:a => 'hi there'}

# To avoid this, we could use greetings[:a].clone to create a new object to perform the concatenation on, OR just use += which returns a new String object.