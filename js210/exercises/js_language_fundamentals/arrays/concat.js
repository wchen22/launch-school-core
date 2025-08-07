// Array Concat Part 1
// In this exercise, you will learn more about Arrays by implementing your own version of the Array.prototype.concat method. Write a function that returns a new array composed of all values from the first array argument and the second array or value argument. Take note of the following specifications when writing your concat function.

// The first argument will always be an array.
// The second argument can be either an array or another value.
// The function should return a new array.
// The elements in the new array should be in the same order as they appear in the arguments.
// The function should copy any object references from the arguments into the new array — i.e., if you make a change to a reference object from one of the arguments after calling concat, those changes should show up in the output array as well.
// The function should copy the values of primitives (e.g., strings, numbers, and booleans).
// Examples:

function concat(array1, ...arguments) {
  // arrays get smushed into array1, objects and other values get preserved as a whole. objects passed by 
  // const output = array1.slice();


  // if (Array.isArray(secondArgument)) {
  //   secondArgument.forEach( element => output.push(element));
  // } else {
  //   output.push(secondArgument);
  // }

  return [array1, ...arguments].flat();
}

console.log(concat([1, 2, 3], [4, 5, 6]));          // [1, 2, 3, 4, 5, 6]
console.log(concat([1, 2], 3));                     // [1, 2, 3]
console.log(concat([2, 3], ['two', 'three']));      // [2, 3, "two", "three"]
console.log(concat([2, 3], 'four'));                // [2, 3, "four"]


const obj = { a: 2, b: 3 };
const newArray = concat([2, 3], obj);
console.log(newArray);                              // [2, 3, { a: 2, b: 3 }]
obj.a = 'two';
console.log(newArray);                              // [2, 3, { a: "two", b: 3 }]

const arr1 = [1, 2, 3];
const arr2 = [4, 5, obj];
const arr3 = concat(arr1, arr2);
console.log(arr3);                                  // [1, 2, 3, 4, 5, { a: "two", b: 3 }]
obj.b = 'three';
console.log(arr3);                                  // [1, 2, 3, 4, 5, { a: "two", b: "three" }]

arr3[5].b = 3;                         // or, `arr3[5]['b'] = 3;`
console.log(obj);                                   // { a: "two", b: 3 }

// Array Concat Part 2

// The concat function from the previous exercise could only concatenate a maximum of two arrays. For this exercise, you are going to extend that functionality. Refactor the concat function to allow for the concatenation of two or more arrays or values.

console.log(concat([1, 2, 3], [4, 5, 6], [7, 8, 9]));    // [1, 2, 3, 4, 5, 6, 7, 8, 9]
console.log(concat([1, 2], 'a', ['one', 'two']));        // [1, 2, "a", "one", "two"]
console.log(concat([1, 2], ['three'], 4));               // [1, 2, "three", 4]