# Back in the stone age (before CSS) we used spaces to align things on the screen. If we had a table of Flintstone family members that was forty characters in width, how could we easily center that title above the table with spaces?

title = "Flintstone Family Members"

flintstones =  "Fred Barney Wilma Betty BamBam Pebbles Dino"

# puts title.rjust(title.size + (flintstones.size - title.size)/2)

# Well, there's a method for that

puts title.center(flintstones.size)
puts flintstones