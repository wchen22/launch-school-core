# In the ages hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# remove people with age 100 and greater.

# Basic loop
ages.each do |name, age|
  ages.delete(name) if age >= 100
end
p ages

# There's a handy delete_if method for this though
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.delete_if do |name, age|
  age >= 100
end
p ages

# keep_if, which is destructive
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.keep_if { |_, age| age < 100 }
p ages

# or #select!
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages.select! { |_, age| age < 100 }
