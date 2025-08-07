// Array Copy Part 1
// Read through the code shown below. What does it log to the console at lines 5, 6, 9, and 10?

// let myArray = [1, 2, 3, 4];
// const myOtherArray = myArray; // myArray and myOtherArray now both point to the same array in memory, so mutations on either variable will be reflected in the other.

// myArray.pop();
// console.log(myArray); // [1,2,3]
// console.log(myOtherArray); // [1,2,3]

// myArray = [1, 2]; 
// console.log(myArray); // [1,2]
// console.log(myOtherArray);// [1,2,3]

// Array Copy Part 2
// In the previous exercise, the value of the reference gets copied. For this exercise, only the values of the array should be copied, but not the reference. Implement two alternative ways of doing this.

// Here is the code from the previous exercise:

let myArray = [1, 2, 3, 4];
// const myOtherArray = [...myArray]; // array destructuring
const myOtherArray = myArray.slice(); // slice returns a copy

myArray.pop();
console.log(myArray);
console.log(myOtherArray);

myArray = [1, 2];
console.log(myArray);
console.log(myOtherArray);
