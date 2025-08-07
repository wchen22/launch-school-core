// Convert a String to a Number
// For this exercise we're going to learn more about type conversion by implementing our own parseInt function that converts a string of numeric characters (including an optional plus or minus sign) to a number.

// The function takes a string of digits as an argument, and returns the appropriate number. Do not use any of the built-in functions for converting a string to a number type.

// For now, do not worry about leading + or - signs, nor should you worry about invalid characters; assume all characters will be numeric.

function stringToInteger(digitString) {
  let numberValue = 0;

  for (let index = digitString.length - 1; index >= 0; index -=1) {
    const digitValue = digitString.charCodeAt(index) - 48;
    const power = digitString.length - index - 1;
    numberValue += digitValue * (10 ** power);
  }

  return numberValue;
}

// Examples:

console.log(stringToInteger('4321'));      // 4321
console.log(stringToInteger('570'));       // 570

// Convert a String to a Signed Number
// The previous exercise mimics the parseInt function to a lesser extent. In this exercise, you're going to extend that function to work with signed numbers.

// Write a function that takes a string of digits and returns the appropriate number as an integer. The string may have a leading + or - sign; if the first character is a +, your function should return a positive number; if it is a -, your function should return a negative number. If there is no sign, return a positive number.

// You may assume the string will always contain a valid number.

function stringToSignedInteger(string) {
  // let signToFactor = 1;
  // let digitsOnly = string;

  // const trimSign = (string) => string.split('').splice(1).join('');

  // if (string[0] === '-'){
  //   signToFactor = -1;
  //   digitsOnly = trimSign(string);
  // } else if (string[0] === '+') {
  //   digitsOnly = trimSign(string);
  // }

  // return signToFactor * stringToInteger(digitsOnly);

  switch(string[0]) {
    case '-': return -stringToInteger(string.slice(1));
    case '+': return stringToInteger(string.slice(1));
    default: return stringToInteger(string);
  }
}

// Examples:

console.log(stringToSignedInteger('4321'));      // 4321
console.log(stringToSignedInteger('-570'));      // -570
console.log(stringToSignedInteger('+100'));      // 100

// Convert a Number to a String
// In the previous two exercises, you developed functions that convert simple numeric strings to signed integers. In this exercise and the next, you're going to reverse those functions.

// You will learn more about converting strings to numbers by writing a function that takes a positive integer or zero, and converts it to a string representation.

// You may not use any of the standard conversion functions available in JavaScript, such as String(), Number.prototype.toString, or an expression such as '' + number. Your function should do this the old-fashioned way and construct the string by analyzing and manipulating the number.

const DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

function integerToString(integer) {
  let output = '';

  do {
    let currentRemainder = integer % 10;
    output = DIGITS[currentRemainder] + output;
    integer = (integer - currentRemainder) / 10;

  } while (integer > 0);

  return output;
}

// Examples:

console.log(integerToString(4321));      // "4321"
console.log(integerToString(0));         // "0"
console.log(integerToString(5000));      // "5000"

// Convert a Signed Number to a String
// In the previous exercise, you reimplemented a function that converts non-negative numbers to strings. In this exercise, you're going to extend that function by adding the ability to represent negative numbers.

// You may not use any of the standard conversion functions available in JavaScript, such as String(), Number.prototype.toString, or an expression such as '' + number. You may, however, use the integerToString function from the previous exercise.

function signedIntegerToString(number) {
  if (number < 0) {
    return '-' + integerToString(-number);
  } else if (number > 0) {
    return '+' + integerToString(number);
  } else if (Object.is(number, -0)) {
    return '-0';
  } else {
    return integerToString(number);
  }
}

// Examples:

console.log(signedIntegerToString(4321));      // "+4321"
console.log(signedIntegerToString(-123));      // "-123"
console.log(signedIntegerToString(0));         // "0"

// Further Exploration

//See Exercise 9 in the More Stuff chapter in the JavaScript book for information about -0. How would you fix this problem?


console.log(integerToString(-0));
console.log(signedIntegerToString(-0));
console.log(signedIntegerToString(-0) === "-0"); // false

// Javascript has two values for 0: 0 and -0. The original method when called with -0 traverses the else branch, invoking integerToString with -0. The do...while loop always runs once, and DIGITS[integer] interestingly will treat -0 as the same index value as 0, setting the output to 0. To fix this issue, probably makes sense to use the Object.is method which distinguishes between the two.
