# Practice Problem 1

What is the return value of the select method below? Why?

```
[1, 2, 3].select do |num|
  num > 5
  'hi'
end
```
> Since the last line of the block is the string 'hi' which is a truthy value, the block evaluates to true for each iteration of the array. Therefore, select will return a new array with all of the elements of the original array: [1, 2, 3].

# Practice Problem 2

How does count treat the block's return value? How can we find out?
```
['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end
```
> #count will increment a count value if the block returns a truthy value for each element of the array iterated and return the final value at the end of iteration.

# Practice Problem 3

What is the return value of reject in the following code? Why?
```
[1, 2, 3].reject do |num|
  puts num
end
```
> ```[1,2,3]```. From the documentation, we know that reject returns a new array including all the elments of the calling array for which the block returns false or nil. Since puts always returns nil, every element is preserved in the new array.

# Practice Problem 4

What is the return value of each_with_object in the following code? Why?
```
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end
```
> {'a' => 'ant', 'b' => 'bear', 'c' => 'cat'}. each_with_object will iterate the given block over the calling array as well as a hash argument, assigning the first letter of each string to the hash as a key with the full string as the value.
# Practice Problem 5

What does shift do in the following code? How can we find out?
```
hash = { a: 'ant', b: 'bear' }
hash.shift
```
> Based on the documentation, shift will return the first element of the hash (based on entry order) as an array object containing the key and the value (if the hash is blank, it simply returns the default value of the hash). In this case it will remove a: 'ant' from the hash and return [:a, 'ant'].

# Practice Problem 6

What is the return value of the following statement? Why?
```
['ant', 'bear', 'caterpillar'].pop.size
```
> Array#pop will destructively remove the last element of an array and return it. In this case that is the string 'caterpillar'. We chain String#size to this value, returning its character length which is 11.

# Practice Problem 7

What is the block's return value in the following code? How is it determined? Also, what is the return value of any? in this code and what does it output?
```
[1, 2, 3].any? do |num|
  puts num
  num.odd?
end
```
* The block's return value is a boolean depending on if the current num is odd.
* The return value of any? is true if the block returns true for any of the array elements, false otherwise. The block's return value is the result of num.odd? on the current element. Since the block returns true on the first element 1, the any? block will return true AND STOP ITERATING after this point.
* As a result, puts num is only ever invoked on the first item in the array, so the output of any? will just be a printed 1.
# Practice Problem 8

How does take work? Is it destructive? How can we find out?
```
arr = [1, 2, 3, 4, 5]
arr.take(2)
```
* => [1,2]
* According to the documentation, Array#take returns the first n elements of an array as a new array, so it is not destructive.
# Practice Problem 9

What is the return value of map in the following code? Why?
```
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end
```
* Hash class doesn't have a map function, it uses Enumerable#map which returns an array containing the block return values of each element.
* => [nil, 'bear']
* On the first iteration, value.size is not greater than 3 so the block returns nil (if statements return nil if none of the conditions evaluate as true).


# Practice Problem 10

What is the return value of the following code? Why?
```
[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
```
* ```[1,nil,nil]```
* There will be an output of
  * 2
  * 3 
* Block return values are determined by the return value of the last statement evaluated within the block. Based on its conditional logic, the block evaluates to 1, then nil and nil because puts statements return nil.
