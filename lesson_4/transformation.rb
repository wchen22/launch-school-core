# Can you implement a double_numbers! method that mutates its argument?

def double_numbers!(numbers_array)
  counter = 0

  loop do
    break if counter == numbers_array.size

    numbers_array[counter] *= 2

    counter += 1
  end
end

numbers = [1, 5, 10, -2, 0]
double_numbers!(numbers)
p numbers
p double_numbers!([])

# Try coding a solution that doubles the numbers that have odd indices:

def double_odd_indices(numbers)
  doubled_numbers = []
  
  counter = 0
  
  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    doubled_numbers << (counter.odd? ? current_number * 2 : current_number)
    
    # if counter.odd?
    #   doubled_numbers << current_number * 2
    # else
    #   doubled_numbers << current_number
    # end

    counter += 1
  end
  doubled_numbers
end

p double_odd_indices([0, 1, 4, 3, 8, 5])