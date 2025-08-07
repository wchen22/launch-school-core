/* eslint-disable max-len */
// Array Pop and Push
// In this exercise, you will implement your own version of two Array methods: Array.prototype.pop and Array.prototype.push. The pop method removes the last element from an array and returns that element. If pop is called on an empty array, it returns undefined. The push method, on the other hand, adds one or more elements to the end of an array and returns the new length of the array.

// Examples:

function pop(array) {
  // const poppedElement = array.splice(array.length - 1)[0];
  // return poppedElement;

  // Further Exploration
  if (array.length === 0) return undefined;

  const poppedElement = array[array.length - 1];
  array.length -= 1;
  return poppedElement;
}

// pop
const array1 = [1, 2, 3];
console.log(pop(array1));                        // 3
console.log(array1);                // [1, 2]
console.log(pop([]));                           // undefined
console.log(pop([1, 2, ['a', 'b', 'c']]));      // ["a", "b", "c"]

function push(array, ...args) {
  (args).forEach( arg => {
    array[array.length] = arg;
  });
  return array.length;
}
// push
const array2 = [1, 2, 3];
console.log(push(array2, 4, 5, 6));              // 6
console.log(array2);                // [1, 2, 3, 4, 5, 6]
console.log(push([1, 2], ['a', 'b']));          // 3
console.log(push([], 1));                       // 1
console.log(push([]));                          // 0

// Further Exploration
//The current solution for pop uses the Array.prototype.splice method. Can you reimplement the pop function without using the splice method?

// set array.length to array.length - 1 after retrieving the popped element


// Array and String Reverse
// In this exercise, you will implement your own version of the Array.prototype.reverse method. Your implementation should differ from the built-in method in the following two ways:

// It should accept either a string or an array as an argument.
// It should return a new string or array.
// Examples:

function reverse(inputForReversal) {
  const inputLength = inputForReversal.length;
  let output = inputForReversal.slice(inputLength);

  for (let index = inputLength - 1; index >= 0; index -= 1) {
    output = output.concat(inputForReversal[index]);
  }

  return output;
}

console.log(reverse('Hello'));           // "olleH"
console.log(reverse('a'));               // "a"
console.log(reverse([1, 2, 3, 4]));      // [4, 3, 2, 1]
console.log(reverse([]));                // []

const array = [1, 2, 3];
console.log(reverse(array));             // [3, 2, 1]
console.log(array);                      // [1, 2, 3]

// Array Shift and Unshift

// In this exercise, you will implement your own versions of the Array.prototype.shift and Array.prototype.unshift methods. These methods manipulate the contents of an array starting from the first index.

// The shift method removes the first element from an array and returns that element; if the array is empty, shift returns undefined. The unshift method adds one or more elements to the start of an array and returns the new length of the array. Both methods mutate the original array.

// Examples:

function shift(array) {
  const output = array[0];

  array.forEach ( (_element, index) => {
    array[index] = array[index + 1];
  } );

  if (array.length > 0) array.length -= 1;
  return output;
}

// This solution assumed that when provided more than one argument to unshift, they would go in one at a time and end up reversed at the beginning. To make them preserve order, could reverse args array before iterating, or iterate over them backwards.
function unshift(array, ...args) {
  args.forEach ( arg => {
    array.length += 1;

    let toSwap = arg;
    for (let index = 0; index < array.length; index += 1 ) {
      [toSwap, array[index]] = [array[index], toSwap];
    }
  });

  return array.length;
}

console.log(shift([1, 2, 3]));                // 1
console.log(shift([]));                       // undefined
console.log(shift([[1, 2, 3], 4, 5]));        // [1, 2, 3]

console.log(unshift([1, 2, 3], 5, 6));        // 5
let anArray = [1, 2, 3];
unshift(anArray, 5, 6);
console.log(anArray);

console.log(unshift([1, 2, 3]));              // 3
console.log(unshift([4, 5], [1, 2, 3]));      // 3

const testArray = [1, 2, 3];
console.log(shift(testArray));                // 1
console.log(testArray);                       // [2, 3]
console.log(unshift(testArray, 5));           // 3
console.log(testArray);                       // [5, 2, 3]

function unshift2(array, ...args) {
  for (let i = 0; i < args.length; i += 1) {
    array.splice(i , 0, args[i]);
  }

  return array.length;
}

let anotherArray = [1, 2, 3];
unshift2(anotherArray, 5, 6);
console.log(anotherArray);


// Array Slice and Splice
// In this exercise, you will implement your own versions of the Array.prototype.slice and Array.prototype.splice methods according to the following specifications.

// The slice function takes three arguments: an array, and two integers representing a begin and an end index. The function returns a new array containing the extracted elements starting from begin up to but not including end. slice does not mutate the original array.

// The splice function changes the contents of an array by deleting existing elements and/or adding new elements. The function takes the following arguments: an array, a start index, a deleteCount, and zero or more elements to be added. The function removes deleteCount number of elements from the array, beginning at the start index. If any optional element arguments are provided, splice inserts them into the array beginning at the start index. The function returns a new array containing the deleted elements, or an empty array ([]) if no elements are deleted. splice mutates the original array.

// Additional specifications:

// slice:

// The values of begin and end will always be integers greater than or equal to 0.
// If the value of begin or end is greater than the length of the array, set it to equal the length.
// splice:

// The values of start and deleteCount will always be integers greater than or equal to 0.
// If the value of start is greater than the length of the array, set it to equal the length.
// If the value of deleteCount is greater than the number of elements from start up to the end of the array, set deleteCount to the difference between the array's length and start.
// Takes optional arguments for elements to add to the array; denoted by the rest parameter ...args. If no elements to add are provided, splice only removes elements from the array.
// Examples:
console.clear();

function slice(array, begin, end) {
  const output = [];
  begin = Math.min(array.length, end)
  end = Math.min(array.length, end);

  for (let index = begin; index < indexMax; index += 1) {
    output.push(array[index]);
  }

  return output;
}

console.log(slice([1, 2, 3], 1, 2));               // [2]
console.log(slice([1, 2, 3], 2, 0));               // []
console.log(slice([1, 2, 3], 5, 1));               // []
console.log(slice([1, 2, 3], 0, 5));               // [1, 2, 3]

const arr1 = [1, 2, 3];
console.log(slice(arr1, 1, 3));                     // [2, 3]
console.log(arr1);                                  // [1, 2, 3]

function splice(array, start, deleteCount, ...toAdd) {
  const output = [];
  start = Math.min(start, array.length);
  deleteCount = Math.min(deleteCount, array.length - start);
  
  const addCount = toAdd.length;
  toAdd = toAdd.concat(slice(array, start + deleteCount , array.length));

  for (let index = start; index < array.length; index += 1) {
    if (output.length < deleteCount) {
      output.push(array[index]);
    }
    array[index] = toAdd[index - start];
  }

  array.length = array.length + (addCount - deleteCount);

  return output;
}
  
console.log("SPLICE");
console.log(splice([1, 2, 3], 1, 2));              // [2, 3]
console.log(splice([1, 2, 3], 1, 3));              // [2, 3]
console.log(splice([1, 2, 3], 1, 0));              // []
console.log(splice([1, 2, 3], 0, 1));              // [1]
console.log(splice([1, 2, 3], 1, 0, 'a'));         // []

const arr2 = [1, 2, 3];
console.log(splice(arr2, 1, 1, 'two'));             // [2]
console.log(arr2);                                  // [1, "two", 3]

const arr3 = [1, 2, 3];
console.log(splice(arr3, 1, 2, 'two', 'three'));    // [2, 3]
console.log(arr3);                                  // [1, "two", "three"]

const arr4 = [1, 2, 3];
console.log(splice(arr4, 1, 0));                    // []
console.log(splice(arr4, 1, 0, 'a'));               // []
console.log(arr4);                                  // [1, "a", 2, 3]

const arr5 = [1, 2, 3];
console.log(splice(arr5, 0, 0, 'a'));               // []
console.log(arr5);                                  // ["a", 1, 2, 3]