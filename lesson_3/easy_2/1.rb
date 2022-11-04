# In this hash of people and their age,

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# see if "Spot" is present.

p ages.key?("Spot")
p ages.member?("Spot")
p ages["Spot"]
p ages.any?{|key, value| key == "Spot"}
p ages.assoc("Spot")
#p ages.fetch("Spot")
