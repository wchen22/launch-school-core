// Write a function named startCounting that logs a number to the console every second, starting with 1. Each number should be one greater than the previous number.

function startCounting() {
  let number = 1;
  return setInterval(() => {
    console.log(number);
    number += 1;
  }, 1000);
}

let logger = startCounting();

// Extend the code from the previous problem with a stopCounting function that stops the logger when called.

function stopCounting() {
  clearInterval(logger);
}

setTimeout(stopCounting, 3500);

// Write a program that does the following:

// Logs "Starting..." immediately.
// Every 2 seconds, logs "Hello!".
// After 10 seconds, stops logging "Hello!" and logs "Goodbye!".
// Hint
// Show Solution

function logStuff() {
  console.log("Starting...");
  let helloLogger = setInterval(() => console.log('Hello!'), 2000);
  setTimeout(() => {
    clearInterval(helloLogger);
    console.log("Goodbye!");
  }, 10000);
}

logStuff();