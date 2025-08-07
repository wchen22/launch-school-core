// Tip Calculator
// Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. The program must compute the tip, and then log both the tip and the total amount of the bill to the console. You can ignore input validation and assume that the user will put in numbers.

// Example:

// What is the bill? 200
// What is the tip percentage? 15

// The tip is $30.00
// The total is $230.00

const readline = require('readline-sync');

const bill = parseFloat(readline.question('What is the bill? '));
const tip_percent = parseFloat(readline.question('What is the tip percentage? '));

const tip_amount = (bill * tip_percent / 100);
const total = bill + tip_amount;

console.log(`The tip is $${tip_amount.toFixed(2)}`);
console.log(`The total is $${total.toFixed(2)}`);