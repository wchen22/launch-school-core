# In the array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Find the index of the first name that starts with "Be"

flintstones.each_with_index do |name, idx|
  if name.start_with?("Be")
    puts idx
    return # Can include this if you want to stop checking after the first matching instance
  end
end

# LS solution

p flintstones.index { |name| name[0, 2] == 'Be' } # Here we pass index a block, which returns the index of the first object for which the block returns true. 