// Odd Numbers
// Log all odd numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

// for (let i = 1; i <= 99; i += 2) {
//   console.log(i);
// }

// Further Exploration
// Repeat this exercise with a technique different from the one that you used, and different from the one provided. Also consider adding a way for the user to specify the limits of the odd numbers logged to the console.

let readline = require("readline-sync");
let limit = parseInt(readline.question("Highest number to log?"));

let start = 1;

// while (start <= limit) {
//   console.log(start);
//   start += 2;
// }

do {
  console.log(start);
  start += 2;
} while (start <= limit);

// Even Numbers
// Log all even numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

// const numbers = [...Array(99).keys()].map(index => index + 1);

// numbers.forEach(num => {
//   if (num % 2 === 0) console.log(num);
// });