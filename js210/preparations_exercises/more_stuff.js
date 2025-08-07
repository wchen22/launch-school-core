// 1) What does this code log to the console? Why?

let array1 = [1, 2, 3];
let array2 = array1;
array1[1] = 4;
console.log(array2);
// Solution
// [1, 4, 3] is logged because since the value of array1 is an object; assigning array1 to array2 will assign it a reference to that same object in memory. Assigning the element at index 1 mutates the array which will be reflected in both variables.


// 2) What do the following error message and stack trace tell you?

// $ node exercise2.js
// /Users/wolfy/tmp/exercise2.js:4
//   console.log(greeting);
//               ^

// ReferenceError: greeting is not defined
//     at hello (/Users/wolfy/tmp/exercise2.js:4:15)
//     at Object.<anonymous> (/Users/wolfy/tmp/exercise2.js:13:1)
//     at Module._compile (internal/modules/cjs/loader.js:721:30)
//     at Object.Module._extensions..js (internal/modules/cjs/loader.js:732:10)
//     at Module.load (internal/modules/cjs/loader.js:620:32)
//     at tryModuleLoad (internal/modules/cjs/loader.js:560:12)
//     at Function.Module._load (internal/modules/cjs/loader.js:552:3)
//     at Function.Module.runMain (internal/modules/cjs/loader.js:774:12)
//     at executeUserCode (internal/bootstrap/node.js:342:17)
//     at startExecution (internal/bootstrap/node.js:276:5)
// Solution

// A ReferenceError is thrown by the code at line 4, column 15 when the program is run. At this point, there is no variable 'greeting' available in scope. The execution context on the call stack is that of the a function named hello, which is (probably?) a function in the global scope denoted by Object.<anonymous> which is how the main scope of a Javascript program is usually represented. hello was invoked on line 13.

// 3) Write some code to output the square root of 37.

console.log(Math.sqrt(37));

// Solution
// 4) Given a list of numbers, write some code to find and display the largest numeric value in the list.

// List	Max
// 1, 6, 3, 2	6
// -1, -6, -3, -2	-1
// 2, 2	2
// Solution

// function showLargest(array) {
//   let max = array[0];
//   for (let num of array) {
//     if (num > max ) max = num;
//   }
//   return max;
// }

// console.log(showLargest([1, 6, 3, 2])) // 6
// console.log(showLargest([-1, -6, -3, -2])) // -1
// console.log(showLargest([2, 2])) // 2
// console.log(Math.max(1, 6, 3, 2));
 
// 5) What does the following function do?

// function doSomething(string) {
//   return string.split(' ').reverse().map((value) => value.length);
// }
// Solution
// It takes a string as an argument and chains several methods to it: first it splits it on space ' ' characters into an array of words, upon which it invokes the reverse() method reversing the order of the words, and finally it invokes map() on that function, using an arrow function as an argument to map each value to its length as given by the String.length property. Something like Wilson Chen -> ['Wilson', 'Chen'] -> ['Chen', 'Wilson'] -> [4, 6]



// 6) Write a function that searches an array of strings for every element that matches the regular expression given by its argument. The function should return all matching elements in an array.

// Example

// function allMatches(array, regex){
//   return array.filter(string => regex.test(string));
// }

// let words = [
//   'laboratory',
//   'experiment',
//   'flab',
//   'Pans Labyrinth',
//   'elaborate',
//   'polar bear',
// ];

// console.log(allMatches(words, /lab/)); // => ['laboratory', 'flab', 'elaborate']

// 7) What is exception handling and what problem does it solve?

// Certain types of invalid code or logic can create an error which the Javascript engine can raise (also known as throwing an exception) by stopping the program's execution and notifying users of the type of error. In some cases, developers might anticipate the possibility of certain errors and use exception handling to tell Javascript what to do instead of stopping execution when those exceptions are raised (by using the `catch` block to catch those exceptions.)


// 8) Challenging Exercise This exercise has nothing to do with this chapter. Instead, it uses concepts you learned earlier in the book. If you can't figure out the answer, don't worry: this question can stump developers with more experience than you have.

// Earlier, we learned that Number.isNaN(value) returns true if value is the NaN value, false otherwise. You can also use Object.is(value, NaN) to make the same determination.

// Without using either of those methods, write a function named isNotANumber that returns true if the value passed to it as an argument is NaN, false if it is not.

// function isNotANumber(value) {
//   return String(value) === 'NaN' && String(value) !== value;
//   // return value !== value;
// }

// console.log(isNotANumber(NaN)); // true
// console.log(isNotANumber('NaN')); // false
// console.log(isNotANumber(undefined)) // false
// console.log(isNotANumber(null)) // false
// console.log(isNotANumber(5)) // false
// console.log(isNotANumber(false)) // false

// 9) Challenging Exercise This exercise has nothing to do with this chapter. Instead, it uses concepts you learned earlier in the book. If you can't figure out the answer, don't worry: this question can stump developers with more experience than you have.

// Earlier, we learned that JavaScript has multiple versions of the numeric value zero. In particular, it has 0 and -0. While it's mathematically nonsensical to distinguish between 0 and -0, they are distinct values in JavaScript. We won't get into why JavaScript has a 0 and -0, but it can be useful in some cases.

// There's a problem, however: JavaScript itself doesn't seem to realize that the values are distinct:


// > 0 === -0
// = true

// > String(-0)
// = '0'
// Fortunately, you can use Object.is to determine whether a value is -0:


// > let value = -0;
// > Object.is(value, 0)
// = false

// > Object.is(value, -0)
// = true
// There are other ways to detect a -0 value. Without using Object.is, write a function that will return true if the argument is -0, and false if it is 0 or any other number.

// function isNegativeZero(value){
//   return 1 / value === -Infinity;
// }
// console.log(isNegativeZero(0)); // false
// console.log(isNegativeZero(5)); // false
// console.log(isNegativeZero(-0)); // true


// 10) Challenging Exercise This exercise has nothing to do with this chapter. Instead, it uses concepts you learned earlier in the book. If you can't figure out the answer, don't worry: this question can stump developers with more experience than you have.

// Consider this code:


// > let x = "5"
// > x = x + 1
// = "51"
// Now, consider this code:


// > let y = "5"
// > y++
// What gets returned by y++ in the second snippet, and why?

// So post-increment operator is NOT the same as +=, or y = y + 1 notation. Two important things 1) It will coerce any string operands to a number; and 2) It returns the original value of the operand. So in this case numeric 5 is returned.

