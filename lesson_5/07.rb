# Given this code, what would be the final values of a and b? Try to work this out without running the code.

a = 2
b = [5, 8]
arr = [a, b]  # [2, [5,8]]

arr[0] += 2 # arr = [4, [5,8]] ; a = 2
arr[1][0] -= a # arr = [4, [3, 8]] 

p arr
# a would remain 2, b would be [3, 8]. On line 7, we explicitly are modifying the object at index 0 of array, NOT the variable a. b on the other hand is different because b is an array we are modifying by changing the value of index 0 at that array in line 8.

# IF on line 7 we were instead to do something like a += 2, then a would become 4 but arr would remain [2, [5,8]] at that point. That is because we are reassigning a, not the arr[0]. They are both pointers to the object 2 after line 5, and reassigning one doesn't reassign the other. 

