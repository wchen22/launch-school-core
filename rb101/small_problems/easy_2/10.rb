# What will the following code print, and why? Don't run the code until you have tried to answer.

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value } 
array1.each { |value| value.upcase! if value.start_with?('C', 'S') } # [Moe, Larry, CURLY, SHEMP, Harpo, CHICO, Groucho, Zeppo]
puts array2
# Will print [Moe, Larry, CURLY, SHEMP, Harpo, CHICO, Groucho, Zeppo] on separate lines. When we call array2 << value for each value of array1, Ruby assigns to each individual element of array2 a reference to that array1 value. Calling upcase! on certain array1 values will mutate the objects both array1 elements and array2 elements point to. 

# Ruby doesn't appear to have a built in deep copy method, but one way to avoid this is to mutate the entire array object like below. Could use map! or non-destructive map and reassign that map's return value to a new object. 

# The documentation states for map! "Invokes the given block once for each element of self, replacing the element with the value returned by the block.", which sounds like the element at each index is being reassigned to a new value provided by the block, which allows for the 'copied' array to retain its references to the original values. 

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value } 

array1.map! { |value| value.start_with?('C', 'S') ? value.upcase : value } # [Moe, Larry, CURLY, SHEMP, Harpo, CHICO, Groucho, Zeppo]
p array1 # ["Moe", "Larry", "CURLY", "SHEMP", "Harpo", "CHICO", "Groucho", "Zeppo"]
p array2 # ["Moe", "Larry", "Curly", "Shemp", "Harpo", "Chico", "Groucho", "Zeppo"]

# Can also re-assign the entire array to the return value of a non-destructive method like map
array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value } 

array1 = array1.map { |value| value.start_with?('C', 'S') ? value.upcase : value } # [Moe, Larry, CURLY, SHEMP, Harpo, CHICO, Groucho, Zeppo]
p array1 # ["Moe", "Larry", "CURLY", "SHEMP", "Harpo", "CHICO", "Groucho", "Zeppo"]
p array2 # ["Moe", "Larry", "Curly", "Shemp", "Harpo", "Chico", "Groucho", "Zeppo"]