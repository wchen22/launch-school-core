let rlSync = require('readline-sync');

let number1= rlSync.question('Number 1 please\n');

let number2 = rlSync.question('Number 2 please\n');

let sum = Number(number1) + Number(number2);

console.log(`The sum of ${number1} and ${number2} is ${sum}.`)