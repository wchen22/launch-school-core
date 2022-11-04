# The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:

numbers = [1, 2, 3, 4, 5]

# What do the following method calls do (assume we reset numbers to the original array between method calls)?

numbers.delete_at(1) # Will delete the object at index 1 of the array, which is 2 => [1, 3, 4, 5] This method call returns the removed item 2
numbers.delete(1) # Will delete all instances of the provided argument, in this case integer 1. => [2, 3, 4, 5]. This method call returns the removed item 1