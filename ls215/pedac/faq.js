// Let's walk through the process of creating test cases for a hypothetical interview problem, so that we can get some practice applying these guidelines. We are given the problem description: "Write a function called doubler that doubles every value in an array". We are not given any test cases, so we'll have to create them all on our own.

// Input: Array of values
  // Q? What input types can we expect?
  // Q? Do we need to anticipate a sparse, empty, or array with properties? 'Value' could refer to a property value
// Output: Array of values
  // Q? Mutate or return new array?
// Definition: 'doubles'
  // Numbers
    // Special # values? NaN, Infinity, -Infinity
  // Strings
  // Non-Primitives
    // Arrays, Objects => reference duplicated, not value
// Rules: 

// What input types can be in the array we receive?
  // What does 'double' mean for each type?
    // Numbers: multiply by 2
    // Strings: concatenate to itself
    // Arrays: 'double' recursively?
// Do we mutate the array or return a new one?

// - elements that are numbers should be multiplied by 2
// - elements that are strings should be repeated twice via concatenation
// - other types of elements should be duplicated in the array
// - the input array should not be mutated
// - elements that are special number values should remain unchanged
// - elements that are any other type of number should be treated normally (multiplied by 2)
// - elements that are empty strings should remain unchanged
// - elements that are any other type of string should be treated normally (repeated twice)
// - the input array can contain a mixture of different types of elements
// - non-primitive elements should have their reference duplicated, not their value
// - elements that appear more than once should be treated normally (as specified above)
// - elements that contain nested arrays or objects should be treated normally (duplicated)
// - if the input array contains empty slots (a "sparse array"), they should be removed
// - if an inner array (element) contains empty slots, they should remain unchanged
// - if the input array contains any object properties, they should remain unchanged
// - if an inner array (element) contains any object properties, they should remain unchanged
// - if the array is empty, return an empty array
// - if multiple arguments are passed, ignore all but the first
// - if the argument is a string, treat it as an array of characters
// - if the argument is a non-negative integer, treat it as an array of digits
// - if the argument is an object, treat it as an array of its property values
// - all other kinds of inputs are invalid, and should return the string 'Invalid input'
