def greet(name: "asdf", greeting: "Hello")
  "#{greeting}, #{name}!"
end

#puts greet("Alice") # Outputs: Hello, Alice!
puts greet(greeting: "Hi",) # Outputs: Hi, Bob!