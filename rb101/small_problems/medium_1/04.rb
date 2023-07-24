# 1000 Lights
# You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat this process and keep going until you have been through n repetitions.

# Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.

# Example with n = 5 lights:

# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
# The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

# With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

def toggle_lights(number)
  lights = (1..number).zip([1] * number)
  hash = lights.to_h

  2.upto(number) do |n|
    hash.each do |switch_number, status|
      if switch_number % n == 0
        hash[switch_number] *= -1
      end
    end
  end
  hash.select { |_position, state| state == 1 }.keys
end

p toggle_lights(5)
p toggle_lights(10)

# Further Exploration
# There are a few interesting points about this exercise that we can explore:

# Do you notice the pattern in our answer? Every light that is on is a perfect square. Why is that?

  # Perfect squares have an odd number of unique factors, while non-perfect squares have an even number of factors (each factor has a counterpart), so odd number of factors in this case will follow pattern of 10...101 while even would have 1010...10

# What are some alternatives for solving this exercise? What if we used an Array to represent our 1000 lights instead of a Hash, how would that change our code?

  # We would have to iterate over the array index instead and make sure we're adding 1 to it to get the nth position light

# We could have a method that replicates the output from the description of this problem (i.e. "lights 2, 3, and 5 are now off; 1 and 4 are on.") How would we go about writing that code?

  # Some tricky edge cases here wrt syntax - 
  # "no lights are off" (0 lights are on)
  # "light 1 is on" (single light)
  # "lights 1 and 4 are on" (two lights)
  # "lights 1, 4, and 9 are on" (>2 lights)
  # We could have a single function for translating array to text
    # Input is an array of numbers, can be a blank array
      # Output if blank => "no lights are "
      # Output if single => "lights #{} is "
      # Output if two or more "lights #{array[0..-2].join(', )} and #{array[-1]} are "
    # Call function and add "off" / "on" to get the two different phrases of the output, then concat them along with a semicolon