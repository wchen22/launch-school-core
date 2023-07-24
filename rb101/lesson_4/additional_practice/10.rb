# Given the munsters hash below

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# Modify the hash such that each member of the Munster family has an additional "age_group" key that has one of three values describing the age group the family member is in (kid, adult, or senior). Your solution should produce the hash below

hash_to_check = { "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }

# Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.

# Problem
  # Input: A hash with string keys (names) and hash values (characteristics). 
  # Output: Modify the same hash to include a new "age_group" key for each member of the family.
  # Mental model: Based on where the "age" values fall within each characteristics hash, "age_group" will be either kid, adult, or senior. 
  # Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.
# Examples
  # "Herman" => { "age" => 32, "gender" => "male" } becomes "Herman" => { "age" => 32, "gender" => "male", age_group => "adult"}
# Data Structure
  # We will be iterating over the munsters hash, checking the age of each member, and then based on that age adding in an age_group key-value pair based on that age value. We will just use the original has for iteration and store age values in a temporary variable for evaluation.
# Algorithm
  # For each |name, traits| in munsters
  # If traits["age"] is between 0 to 17, traits["age_group"] = "kid"
  # If traits["age"] is between 18 to 64, traits["age_group"] = "adult"
  # If traits["age"] is greater than 65, traits["age_group"] = "senior"

munsters.each do |name, traits|
  if (0..17).include?(traits["age"])
    traits["age_group"] = "kid"
  elsif (18..64).include?(traits["age"])
    traits["age_group"] = "adult"
  elsif traits["age"] > 64
    traits["age_group"] = "senior"
  end
end

p munsters
p munsters == hash_to_check

# More readable solution using case and Range objects

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, traits|
  case traits["age"]
  when 0...18
    traits["age_group"] = "kid"
  when 18...65
    traits["age_group"] = "adult"
  else
    traits["age_group"] = "senior"
  end
end

# This solution relies on the case statement which uses Range#=== for the when clauses (returns true if the argument is an element of the range).

p munsters == hash_to_check


