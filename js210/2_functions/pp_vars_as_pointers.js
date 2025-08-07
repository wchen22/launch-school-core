// Question 1
// What will the following code log to the console and why? Don't run it until you have tried to answer.

// let myWord = 'Hello'; 
// let myOtherWord = myWord;

// console.log(myWord); // Hello
// console.log(myOtherWord); // Hello

// Question 2
// What will the following code log to the console and why? Don't run it until you have tried to answer.

// let myWord = 'Hello';
// let myOtherWord = myWord;
// myWord = 'Goodbye';

// console.log(myWord); // 'Goodbye'
// console.log(myOtherWord); // 'Hello'

// Question 3
// What will the following code log to the console and why? Don't run it until you have tried to answer.

// let myWords = ['Hello', 'Goodbye'];
// let myOtherWords = myWords; // because myWords references an object in memory, this assigns myOtherWords to the same object by passing it a copy of myWords' reference.
// myWords[0] = 'Hi'; 

// console.log(myWords); 
// console.log(myOtherWords); // Both print [ 'Hi', 'Goodbye' ]

// Question 4
// What will the following code log to the console and why? Don't run it until you have tried to answer.

// let myWords = ['Hello', 'Goodbye'];
// let myOtherWords = myWords;
// myWords = ['Hi', 'Bye']; // reassigns to a new object

// console.log(myWords); // hi bye array
// console.log(myOtherWords); // hello goodbye array

// Question 5
// What will the following code log to the console and why? Don't run it until you have tried to answer.

// let myWords = ['Hello', 'Goodbye'];
// let myWord = myWords[0]; // reassigns myWord to value of the string at index 0, 'Hello'
// myWords[0] = 'Hi'; // sets myWords array element, ['Hi', 'Goodbye']

// console.log(myWords); // hi goodbye
// console.log(myWord); // hello

// Question 6
// What will the following code log to the console and why? Don't run it until you have tried to answer.

let myWords = ['Hello', 'Goodbye'];
let myWord = 'Hi';
myWords[0] = myWord; // sets first element to a copy of 'Hi'
myWord = 'Hello'; // reassigns myWord to a new string value 'Hello'

console.log(myWords); // hi goodbye
console.log(myWord); // hello
