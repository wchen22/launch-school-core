// Problem 1
// A distinct string is a string that is present only once in an array.

// Given an array of strings, arr, and an integer, k, return the kth distinct string present in arr. If there are fewer than k distinct strings, return an empty string "".

// Note that the result string is the one encountered earliest in the array.

// Example

distinctString(["d","b","c","b","c","a"], 2); // "a"

// Input: array of strings, integer (k)
// Output: A string
  // the kth distinct string present in the array
// Definition and Rule Questions:
  // What does kth distinct mean, i.e. how is order determined?
    // Based on the order of their appearance in the array?
  // Will first argument always be an array?
  // Will array only contain strings?
  // Will array ever be empty or sparse?
  // Will we need to handle nested arrays?
  // Will array have properties we need to account for?
  // Is k always going to be number type 1 or more?
    // How should we handle 0, negative numbers, fractional numbers, special numbers
    // How should we handle missing k argument?
      // => Default to 1st


// Problem 2
// Given an array of integers, nums, return the third largest number in the array. If the third largest number does not exist, return the greatest number.

// You are not allowed to sort the array.

// Example

thirdMax([3, 2, 1]); // 1

// Input: Array of integers
  // Should we always receive precisely one argument? Will the argument always be an array?
    // Will we need to handle empty array or array with properties?
    // Will array only contain integer numbers?
// Output: Number - the third largest in the array. If it doesn't exist, return the greatest number
      // If the array has two greatest values 10.0 and 10, how do we determine which to return?
      // >Missed this one, pretty important: Can the array have repeated numbers, e.g., [3, 3, 1]? If so, how should I handle those? Should I handle the two 3s as different numbers and return 1, or should I return the largest number, 3?​


// Problem 3
// Write a function, primeNumberPrinter, that prints all prime numbers present as substrings in a given string.

// Example

primeNumberPrinter("a4bc2k13d"); // [2, 13]

/**
Problem
-Input: string
  Q: Always a string? How should I handle 0 or more than one argument?
  Q: Does string only contain alphanumeric characters?
    Q: Negative numbers?
  Q: Will string ever be empty?
  Q: Does substring mean: any sequence of substrings with consecutive numeric chars?
-Output: All prime numbers present as substrings of input
  Q: Prime numbers begin with 2?
  Q: How to handle duplicate substrings that are primes?
  Q: Can non-prime numbers separate prime numbers?
    e.g. "241" -> [2, 1] or [241]
  Q: How should I treat strings with just numeric characters?
  Q: Am I always returning the 'greediest', highest prime number?
    e.g. 23 -> [23] vs [2, 3]
  Q: Can numeric characters be 'used' more than once?
    e.g. 23 -> [23] vs [2, 3] vs [2, 3, 23]
  Q: How should output primes be ordered?
  Q: What should output be when there are no prime substrings found?

*/


// Problem 4
// ​Write a function that takes a two-dimensional array as the argument and turns it into a flat array with all duplicated elements removed. Treat numbers and number strings (e.g., 1 and '1') as duplicates, and keep the one that comes first in the result.

// Examples

flattenAndUnique([]); // []
flattenAndUnique([[1, 2, 3], ['3', 4, 5, 'a']]); // [1, 2, 3, 4, 5, 'a']

/**
PROBLEM
Questions:
- What does two dimensional array mean, an array with two nested arrays? or potentially more?
- Should I always expect an array argument?
- Should I always expect one argument? What to do with 0 or more than 1?
- What if the array isn't nested at all? e.g. [1, 2, 3]
- Can the arrays be nested more than one level deep? e.g. [[1, 2 [3, 4]], [5, 6]]
  - Should I flatten all levels in that case, or just the first level?
- Sparse array or array properties need consideration?
- Should I expect array arguments that are not numbers or number strings? If so how should I handle them?
- Should I mutate the array or return a new one?
- When I flatten, will all elements of the first array precede all elements of the second array? 
Input: two dimensional array
- An array with 0 or more inner arrays
  - []
  - [1, 2, 3]
  - [[1, 2][3, 4]]
  - [1, 2, 'a', NaN, null] 
Output: Flat array with all duplicate elements removed
Rules:
- Treat number and number strings as duplicate, keeping the one that comes first e.g. 1 and '1' 
- 
*/


// Based on LS potential questions vs mine, I think it is important to realize that in an interview, questions and clarifying answers are probably a back and forth - and so they should start at a higher level before diving into deeper specifics. e.g. Q1) Should I expect a non-array argument? If yes, then they will either tell me what possible argument types there will be, or I can further enumerate on which ones I need to consider. 
// So that would mean there's probably a good higher to lower order approach to questions, I imagine something like:
// Arguments - what types should I expect? What arity am I dealing with? Based on the rules/definitions, what are the different ways the argument can present itself? (Start with the explicitly defined ways, then explore implicit/edge/unclear cases)