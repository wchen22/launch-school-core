# Write a method that counts the number of occurrences of each element in a given array.

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

# The words in the array are case-sensitive: 'suv' != 'SUV'. Once counted, print each element alongside the number of occurrences.

# Expected output:

# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

def count_occurrences(vehicles)
  counts = Hash.new(0)
  vehicles.each do |element|
    counts[element] += 1
  end
  counts.each {|element, count| puts "#{element} => #{count}"}
end

count_occurrences(vehicles)

# Further exploration: try to solve the problem when words are case insensitive, e.g. "suv" == "SUV".

vehicles = [
  'car', 'cAr', 'truck', 'CAR', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

def count_occurrences(vehicles)
  freq = Hash.new(0)
  vehicles.each do |vehicle|
    freq[vehicle.downcase] += 1
  end
  freq.each {|element, count| puts "#{element} => #{count}"}
end

count_occurrences(vehicles)
