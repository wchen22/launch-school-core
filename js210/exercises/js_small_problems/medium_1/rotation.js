// Write a function that rotates an array by moving the first element to the end of the array. Do not modify the original array.

// If the input is not an array, return undefined.
// If the input is an empty array, return an empty array.
// Review the test cases below, then implement the solution accordingly.

function rotateArray(array) {
  if (!Array.isArray(array)) return undefined;

  if (array.length === 0) return [];

  return array.slice(1).concat(array[0]);
}

console.log(rotateArray([7, 3, 5, 2, 9, 1]));       // [3, 5, 2, 9, 1, 7]
console.log(rotateArray(['a', 'b', 'c']));          // ["b", "c", "a"]
console.log(rotateArray(['a']));                    // ["a"]
console.log(rotateArray([1, 'a', 3, 'c']));         // ["a", 3, "c", 1]
console.log(rotateArray([{ a: 2 }, [1, 2], 3]));    // [[1, 2], 3, { a: 2 }]
console.log(rotateArray([]));                       // []

// return `undefined` if the argument is not an array
console.log(rotateArray());                         // undefined
console.log(rotateArray(1));                        // undefined


// the input array is not mutated
const array = [1, 2, 3, 4];
console.log(rotateArray(array));                    // [2, 3, 4, 1]
console.log(array);                                 // [1, 2, 3, 4]


// Rotation Part 2
// Write a function that rotates the last n digits of a number. For the rotation, rotate by one digit to the left, moving the first digit to the end.

// Examples:
function rotateRightmostDigits(number, n) {
  let str = String(number)
  let preserve = str.slice(0, str.length - n)
  let toRotate =  str.slice(str.length - n);

  return Number(preserve + toRotate.slice(1) + toRotate.slice(0, 1));

}

console.log(rotateRightmostDigits(735291, 1));      // 735291
console.log(rotateRightmostDigits(735291, 2));      // 735219
console.log(rotateRightmostDigits(735291, 3));      // 735912
console.log(rotateRightmostDigits(735291, 4));      // 732915
console.log(rotateRightmostDigits(735291, 5));      // 752913
console.log(rotateRightmostDigits(735291, 6));      // 352917

// Rotation Part 3
// Take the number 735291 and rotate it by one digit to the left, getting 352917. Next, keep the first digit fixed in place and rotate the remaining digits to get 329175. Keep the first two digits fixed in place and rotate again to get 321759. Keep the first three digits fixed in place and rotate again to get 321597. Finally, keep the first four digits fixed in place and rotate the final two digits to get 321579. The resulting number is called the maximum rotation of the original number.

// Write a function that takes an integer as an argument and returns the maximum rotation of that integer. You can (and probably should) use the rotateRightmostDigits function from the previous exercise.

// Examples:

function maxRotation(number) {
  // Starting with digits of a number, going left to right
    // Starting with first digit, incrementing to remaining digits
    // At the digit, the number to rotate is the digit and anything to the right
      // Rotate it one digit to the left. 
      // Append it to the non-rotated part
      // This is the new number
  //  Return the final number


  // for (let index = 0; index < String(number).length; index += 1) {
  //   let string = String(number);
  //   let beginning = string.slice(0, index);
  //   let toRotate = string.slice(index);
  //   let end = rotateRightmostDigits(Number(toRotate), toRotate.length);
  //   number = Number(beginning + String(end));
  // }

  for (let i = String(number).length; i > 1; i -= 1) {
    number = rotateRightmostDigits(number, i);
  }
  
  return number;
    

  // convert to a string
  // iterate over the indices of the string
    // reassign the string to beginning->currentindex + rotateRightmost the slice from current index
  // let string = String(number);
  // for(let index = 0; index < string.length; index += 1) {
  //   let beginning = string.slice(0, index);
  //   let ending = string.slice(index);
  //   //console.log(ending)
  //   string = beginning + rotateRightmostDigits(ending, ending.length);
  // }

  // return Number(string);

  // convert to a string
  // Iterate over the indices of the string
    // begin is slice up to index, end is slice from index
      // rotate rightmostdigits end, end's length and append to being
      // reassign to string

  // 105 -> 051
  // fix 0, 015
  // fix 01, 015

}

console.log(maxRotation(735291));          // 321579
console.log(maxRotation(3));               // 3
console.log(maxRotation(35));              // 53
console.log(maxRotation(105));             // 15 -- the leading zero gets dropped
// 051 fix none, rotate one left
// 015 fix the 0, rotate 15 by 1
// 015 fix the 
console.log(maxRotation(8703529146));      // 7321609845
