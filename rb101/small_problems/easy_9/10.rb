# Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.

def buy_fruit(list)
  list.each_with_object([]) do |item, arr|
    item[1].times { arr << item[0] }
  end.flatten
end

# More readable

def buy_fruit(list)
  result = []
  
  list.each do |item|
    fruit, qty = item
    qty.times { result << fruit }
  end

  result
end

# Example:

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]