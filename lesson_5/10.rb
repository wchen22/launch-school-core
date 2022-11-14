# Given the following data structure and without modifying the original array, use the map method to return a new array identical in structure to the original but where the value of each integer is incremented by 1.

original = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

# The return value from map should be the following array:

should_be = [{a: 2}, {b: 3, c: 4}, {d: 5, e: 6, f: 7}]

answer = original.map do |hash|
  incremented_hash = {}
  hash.each do |key, value|
    incremented_hash[key] = value + 1
  end
  incremented_hash
end

p answer == should_be