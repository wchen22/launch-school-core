const myBoolean = true;
const myString = 'hello';
const myArray = [];
const myOtherString = '';

if (myBoolean) {
  console.log('Hello'); // condition is truthy, logs 'Hello'
}

if (!myString) {
  console.log('World'); // ! negates truthy, so condition is false, skips
}

if (!!myArray) {
  console.log('World');  // empty array is truthy, so !! gets us to true, logs 'Hello'
}

if (myOtherString || myArray) {
  console.log('!'); // '' is falsy, so myArray is evaluated. Truthy, so '!' is logged.
}

// Conditionals Part 2

// One of the ways to manage the flow of a program is through the use of conditionals. Go over the code below and specify how many unique execution paths are possible.

if (condition1) {
  // ...
  if (condition2) {
    // ...
  } else {
    // ...
  } // 2 possibilities from above, if condition1 is truthy
} else {
  // ... // +1 if condition4 not truthy
  if (condition4) { 
    // ...  // +1 if condition5 not truthy
    if (condition5) {
    // ... // +1 if condition5 is truthy
    }
  }
}