# Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

p ages.values.min

# What if I wanted to know the name of the youngest family member?
current_name, current_min = ages.first

ages.each do |name, age| 
  if age < current_min
    current_min = age
    current_name = name
  end
end

p "#{current_name} is the youngest at #{current_min} years old."

# Alternatively could use select
min = ages.values.min
youngest = ages.select { |name, age| age == min }
puts youngest

