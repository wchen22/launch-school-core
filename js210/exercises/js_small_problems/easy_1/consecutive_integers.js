// // Sum or Product of Consecutive Integers
// // Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or the product of all numbers between 1 and the entered integer, inclusive.

// // Examples:

// // Please enter an integer greater than 0: 5
// // Enter "s" to compute the sum, or "p" to compute the product. s

// // The sum of the integers between 1 and 5 is 15.
// // Copy Code
// // Please enter an integer greater than 0: 6
// // Enter "s" to compute the sum, or "p" to compute the product. p

// // The product of the integers between 1 and 6 is 720.

const rlSync = require('readline-sync');

const ASK_NUMBER = 'Please enter an integer greater than 0: '
const NUMBER_LIMITER = { limit(input) { return input > 0 } };
const ASK_OPERATION = 'Enter "s" to compute the sum, or "p" to compute the product. ';
const OPERATION_LIMITER = { limit: ['s', 'p'] };

const highest = parseInt(rlSync.question(ASK_NUMBER, NUMBER_LIMITER), 10);
let range = [...Array(highest).keys()].map( index => index + 1);

const operation = (rlSync.question(ASK_OPERATION, OPERATION_LIMITER) === 's') ? 'sum' : 'product';

let result;
switch (operation) {
  case 'sum':
    result = range.reduce((sum, current) => sum + current, 0);
    break;
  case 'product':
    result = range.reduce((product, current) => product * current, 1);
    break;
}

console.log(`The ${operation} of the integers between ${range[0]} and ${range[range.length - 1]} is ${result}.`)