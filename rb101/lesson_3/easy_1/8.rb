# Turn this into an array containing only two elements: Barney's name and Barney's number

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

p flintstones.assoc("Barney")

# p flintstones.to_a[2]

# flintstones = ["Barney", flintstones["Barney"]]
# p flintstones

# a = flintstones.select{ |k,v| k == "Barney"}.flatten
# p a