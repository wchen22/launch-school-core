# x = 10

# def reassign
#   puts "hey"
#   x = 12
# end

# [1,2,3].each { |i|
#   puts i
#   puts x
# }

# reassign()
# puts x


# Event Emitter

# Create an event emitter that manages event subscriptions and emissions.

# Required Methods:
  # on(event_name: String, action: Proc): associate an event_name with a specific function
  # emit(event_name: String, *args): Trigger that event_name's function
  # off(event_name: String): delete that event_name
  # once(event_name: String, action: Proc): associate an event_name with a function that fires only once

  class EventEmitter
    def initialize
      @events = {}
    end
  
    def on(event_name, action)
      @events[event_name] = {
        action: action,
        temporary: false
      }
    end
  
    def once(event_name, action)
      @events[event_name] = {
        action: action,
        temporary: true
      }
    end
  
    def emit(event_name, *argument)
      if @events[event_name]
        @events[event_name][:action].call(*argument)
        if @events[event_name][:temporary]
          off(event_name)
        end
      end
    end
  
    def off(event_name)
      @events.delete(event_name)
    end
  end
  
  
  emitter = EventEmitter.new
  
  # Test 1: Subscribe to "greet" and emit the event.
  emitter.on("greet", Proc.new { puts "Hello!" })
  puts "Emitting 'greet':"
  emitter.emit("greet")
  # Expected output: "Hello!"
  
  # Test 2: Subscribe to "farewell" and emit the event.
  emitter.on("farewell", Proc.new { puts "Goodbye!" })
  puts "\nEmitting 'farewell':"
  emitter.emit("farewell")
  # Expected output: "Goodbye!"
  
  # Test 3: Remove the "greet" event and try to emit it again.
  emitter.off("greet")
  puts "\nEmitting 'greet' after off (should have no output):"
  emitter.emit("greet")
  
  
  # Test 4: on with args
  emitter.on("greet", Proc.new { |name| puts "Hello, #{name}!" })
  puts "Emitting 'greet' with 'Alice':"
  emitter.emit("greet", "Alice")
  # Expected output: "Hello, Alice!"
  
  # Test 5: multiple args
  emitter.on("adder", Proc.new { |*args| puts *args.sum})
  puts "Adding two nums"
  emitter.emit("adder", 3, 2)
  emitter.emit("adder", 3, 2, 4)
  
  # Expected output: 5
  
  # Test 6: once
  emitter.once("adder", Proc.new { |*args| puts *args.sum})
  emitter.emit("adder", 6, 2)
  # should print 8
  puts "don't print more"
  emitter.emit("adder", 6, 2)
  # print nothing


  # parseFormula instance method that will handle either a number or a formula

  # handle interfaces before going into implementation

  # more pseudocode

  # find units of code/interfaces, build one at a time