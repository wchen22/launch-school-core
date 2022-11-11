# In this example we want to select the key-value pairs where the value is 'Fruit'.
produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(hash)
  selection_hash = {}
  fruits = hash.keys
  counter = 0
  
  loop do
    break if counter == fruits.size

    current_key = fruits[counter]
    current_value = hash[current_key]

    if current_value == 'Fruit'
      selection_hash[current_key] = 'Fruit'
    end

    counter += 1
  end

  selection_hash
end

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
p select_fruit({})
