# See if the name "Dino" appears in the string below:

advice = "Few things in life are as important as house training your pet dinosaur."

puts advice.include?('Dino')
puts advice.match?('Dino')

# NOTE: neither of these accounts for 'Dino' being a substring