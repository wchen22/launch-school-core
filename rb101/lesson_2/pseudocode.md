### A method that returns the sum of two integers
#### Informal
* Given two integers
* Return the sum of the first integer and the second integer
#### Formal
* START
  * Given two integers
* RETURN sum of the two integers

### A method that takes an array of strings, and returns a string that is all those strings concatenated together
#### Informal
* Given an array of strings
* Prepare a blank new string to store output
* Iterate through the array one by one and concatenate each iteration to the output string
* Return the output string
#### Formal
* START
  * Given a collection of strings called "strings"
* SET output = ''
* SET iterator = 1
* WHILE iterator <= length of numbers 
  * SET current_string = value within strings collection at location "iterator"
  * SET output = output + current_string
  * iterator = iterator + 1
* PRINT/RETURN output
* END

### A method that takes an array of integers, and returns a new array with every other element from the original array, starting with the first element. For instance:
#### Informal
* Given an array of integers
* Initiate new empty array output
* Initiate a variable index with value 0
* Iterate through the array one by one using count
  * While index is less than the length of the integer array
    * If count + 1 is odd, push the current value of the integer array to output array
    * Increase count by 1 on each iteration
* Return/print output
#### Formal
* START
  * Given an array of integers called 'integers'
* SET output = []
* SET index = 0
* WHILE index < length of integers array
  * IF value of index + 1 is odd
    * THEN push the value of integers at the current index into the output array
  * SET index to index + 1
* PRINT/RETURN output array

### A method that determines the index of the 3rd occurrence of a given character in a string. For instance, if the given character is 'x' and the string is 'axbxcdxex', the method should return 6 (the index of the 3rd 'x'). If the given character does not occur at least 3 times, return nil.
#### Informal
* Given a character ```x``` and a string ```string```
  * Initiate a variable ```occ``` with value ```0```
  * Iterate over each character ```c``` of ```string```, keeping track of the current index either with an incrementing variable or ```each.with_index```
    * If c is equal to x, set ```occ``` to ```occ + 1```
    * If ```occ``` equals 3, return current index
  * Return ```nil```
#### Formal
* START
  * Given a character ```x``` and a string ```string```
* SET ```occ``` = 0
* SET ```index``` = 0
* WHILE ```index``` < length of ```string```
  * IF character at current index of string is equal to ```x```
    * SET ```occ``` = ```occ + 1```
  * IF ```occ``` == 3
    * PRINT/RETURN ```index```
* PRINT/RETURN ```nil```

### A method that takes two arrays of numbers and returns the result of merging the arrays. The elements of the first array should become the elements at the even indexes of the returned array, while the elements of the second array should become the elements at the odd indexes.
#### Informal
* Given two arrays ```a``` and ```b```
* Initiate a new empty array output
* Create a loop
  * While a is not empty, push the first element of a into output
  * While b is not empty, push the first element of b into output
  * Break if both a and b are empty
* Return/print output
#### Formal
* START
  * Given two arrays ```a``` and ```b```
  * SET ```out``` to an empty array
* LOOP
  * IF ```a.empty?``` is false 
    * PUSH ```a.shift``` to ```out```
  * IF ```b.empty?``` is false
    * PUSH ```b.shift``` to ```out```
  * BREAK if both ```a.empty?``` and ```b.empty?```
* PRINT/RETURN ```out```
