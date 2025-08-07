// Problem Description
// Write a program that cleans up user-entered phone numbers so that they can be sent as SMS messages. Other than digits, the number may also contain special character such as spaces, dash, dot, and parentheses that should be ignored.

// The rules are as follows:

// If the phone number is less than 10 digits, assume that it is a bad number.
// If the phone number is 10 digits, assume that it is good.
// If the phone number is 11 digits and the first number is 1, trim the 1 and use the last 10 digits.
// If the phone number is 11 digits and the first number is not 1, then it is a bad number.
// If the phone number is more than 11 digits, assume that it is a bad number.
// For bad numbers, just a return a string of 10 0s.

/**
PROBLEM
Clean up user-entered phone numbers by removing special characters
Input: A user entered phone number
Output: String representation of cleaned up number, or '0000000000' if it's a bad number

Questions
Am I writing a function that takes a string argument?
Will the argument always be a string? Do I need to handle number inputs?
  - Will the argument contain characters aside from 0-9, [-. ()] ? If so what should I do?
    - If invalid chars, should I remove them and proceed or treat as bad numbers?
Will I ever receive an empty string?
For good numbers, does the returned string include or exclude special characters?
Do special characters in the first index of the string automatically make it bad? e.g. ' 12122332333'
Is a 'digit' only chars 0-9, or any char? // chars 0-9
Rules:
- Bad numbers:
  - Less than 10 digits
  - 11 digits where first number is NOT 1
  - More than 11 digits
- Good numbers: 10 digits?

Data Structure, Algorithm:
- Valid chars are 0-9, [-. ()]
- If the input has any invalid chars, return '0000000000'
- Clean string of any non-digit chars
- The number is bad if:
  - string length is < 10
  - string length is 11 && first digit !== 1
  - string length is > 11
- Return the clean string if good, return '0000000000' if bad

Algorithm:
- Return '0000000000' if invalidInput
  - invalidInput: Any chars that are not 0-9, [-. ()]
- Initialize cleanNumber to: Replace any special characters [-. ()] with ''
- Return '0000000000' if badNumber
  - badNumber:
    - length < 10, length > 11, or length 11 && first digit !== 1
- Return cleanNumber
*/

function cleanNumber(phoneNumber) {
  const DEFAULT = '0'.repeat(10);
  const specialChars = /[-. ()]/g
  const invalidInput = number => /[^0-9-. ()]/.test(phoneNumber) || 
                                 typeof(number) !== 'string';

  if (invalidInput(phoneNumber)) return DEFAULT;

  let cleanNumber = phoneNumber.replace(specialChars, '');

  if (cleanNumber.length === 11 && cleanNumber[0] === '1') {
    return cleanNumber.slice(1);
  } else if (cleanNumber.length === 10) {
    return cleanNumber;
  } else return DEFAULT;
}

// invalid inputs
console.log(cleanNumber(1)); // 0000000000
console.log(cleanNumber('1234567890a')); // 0000000000
console.log(cleanNumber('123456789a')); // 0000000000


// VALID INPUTS
// Bad: Less than 10 digits
console.log(cleanNumber('')); // 0000000000
console.log(cleanNumber('1')); // 0000000000
console.log(cleanNumber('123456789')); // 0000000000
console.log(cleanNumber(' 123456789')); // 0000000000
console.log(cleanNumber('1-234-567-9')); // 0000000000
// Good: 10 digits
console.log(cleanNumber('1234567890')); // '1234567890'
console.log(cleanNumber('123-456-7890')); // '1234567890'
console.log(cleanNumber('123--. ()456--. ()7890')); // '1234567890'
console.log(cleanNumber(' 123-456-7890 ')); // '1234567890'
// Good: 11 digits with leading 1
console.log(cleanNumber('12345678901')); // '2345678901'
console.log(cleanNumber(' 1123-456-7890 ')); // '1234567890'
console.log(cleanNumber(' .1(123)-456-7890 ')); // '1234567890'
console.log(cleanNumber(' 1123-45-. ()6-7890 ')); // '1234567890'
// Bad: 11 digits where first digit is NOT 1
console.log(cleanNumber('22345678901')); // '0000000000'
console.log(cleanNumber(' 3123-456-7890 ')); // '0000000000'
console.log(cleanNumber(' 5123-45-. ()6-7890 ')); // '0000000000'
// Bad: More than 11 digits
console.log(cleanNumber('123456789012')); // '0000000000'


// notes watching video
 // Sam's not asking questions about the special characters or treatment
 // He extrapolates 'user-entered number' to mean writing a function that takes a number, so probably not needed to prompt and intake different types / arities