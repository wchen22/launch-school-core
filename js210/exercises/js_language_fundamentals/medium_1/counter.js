// Counter
// What will the following code snippets log?

// Code Snippet 1
// ---------
// var counter = 5;
// var rate = 3;
// console.log('The total value is ' + String(counter * rate)); 

// function counter(count) {
//   // ...
// }
// function counter is hoisted, var counter reassigns it to 5 during execution phase, will log 15
// ---------


// Code Snippet 2
// ---------
// function counter(count) {
//   return 'asdf';
// }
// console.log('The total value is ' + String(counter * rate));


// var counter = 5;

// var rate = 3;

// During creation phase, function declaration is prioritized, then variables with var declaration. hoisting of var counter initializes counter to undefined, but since counter already exists, it does nothing. So console.log will try to coerce counter into a function and multiply it by rate which is undefined at that point, resulting in NaN being logged.

// ---------


// Code Snippet 3
// ---------
// var counter = 5;
// var rate = 3;

// function counter(count) {
//   // ...
// }

// console.log('The total value is ' + String(counter * rate));
// during creation phase, function counter is fully declared. var counter and rate are also 'hoisted', with rate initialized to undefined and counter not doing anything because counter already exists in namespace. During execution, var counter reassigns counter variable to 5 and rate to 3, so the log line will log 15.
// ---------


// Code Snippet 4
// ---------
let counter = 5;
let rate = 3;

function counter(count) {
  // ...
}

console.log('The total value is ' + String(counter * rate));
// Throws SyntaxError: counter already been declared. ERROR IS THROWN BY LINE 53, NOT 50, because parsing for SyntaxError goes line by line?
// ---------
