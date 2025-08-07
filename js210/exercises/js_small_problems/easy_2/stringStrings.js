// Stringy Strings
// Write a function that takes one argument, a positive integer, and returns a string of alternating '1's and '0's, always starting with a '1'. The length of the string should match the given integer.

function stringy(integer) {
  let output = '';
  for (let num = 1; num <= integer; num += 1) {
    output += num % 2 === 0 ? '0' : '1';
  }

  console.log(output);
}

// Examples:

stringy(6);    // "101010"
stringy(9);    // "101010101"
stringy(4);    // "1010"
stringy(7);    // "1010101"