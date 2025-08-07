// Problem Description
// The Luhn formula is a simple checksum formula used to validate a variety of identification numbers, such as credit card numbers and Canadian Social Insurance Numbers.

// The formula verifies a number against its included check digit, which is usually appended to a partial number to generate the full number. This number must pass the following test:

// Counting from the rightmost digit and moving left, double the value of every second digit
// For any digit that thus become 10 or more, subtract 9 from the result
// 1111 becomes 2121
// 8763 becomes 7733 (from 2 x 6 = 12 -> 12 - 9 = 3 and 2 x 8 = 16 -> 16 - 9 = 7)
// Add all these digits together
// 1111 becomes 2121 sums as 2 + 1 + 2 + 1 to give a checksum of 6
// 8763 becomes 7733, and 7 + 7 + 3 + 3 is 20
// If the total (the checksum) ends in 0 (put another way, if the total modulo 10 is congruent to 0), then the number is valid according to the Luhn Formula; else it is not valid. Thus, 1111 is not valid (as shown above, it comes out to 6), while 8763 is valid (as shown above, it comes out to 20).

// Write a program that, given a number in string format, check if it is valid per the Luhn formula. This should treat, for example, "2323 2005 7766 3554" as valid. You can ignore all non-numeric characters in the input string.


// 3554 = 6514 sums to 16
// 7766 = 5736 sums to 21
// 2005 = 4005 sums to 9
// 2323 = 4343 = 4 + 3 + 4 + 3 = 14 
// total sum is 60, ends in 0, valid

/**
PROBLEM:
Description: Given a number in string format, return true or false based on if it is valid per the Luhn formula. A valid number is one whose checksum is divisible by 10. The checksum is found by going right to left, doubling every second digit and replacing it. If the digit doubled becomes 10 or more, subtract 9 before replacing it. Summing all digits of 'replaced' digit string yields the checksum.
Input: A number in string format
Output: Boolean, whether the input passed the Luhn formula check
Rules:
- Starting with last digit and going left
- Double every SECOND digit to get a replacement
  - If this doubled result is 10 or more, subtract 9 from the replacement
  - and replace the digit
- Sum the replaced number
- If it's divisible by 10 return true, otherwise false

Questions:
- Can we always expect a string?
- Empty string? '' =>
- Number with 1 digit: '9' => false
- Can it begin with 0?

Data Structure and Algorithm
- Input is a string
- Clean any non-digit chars from the string
- Map string's digits to an array of numbers with index
  - If the length of array is odd and the index is odd
        or length is even and the index is even
    - Return doubled(digit)
  - Return digit

- Sum the replaced digits to get the checksum
- Return a boolean true / false if checksum is divisible by 10

HELPER:
double(digit) number * 2, if greater than 9 number * 2 - 9
*/

function double(digit) {
  return (digit * 2 > 9) ? digit * 2 - 9 : digit * 2;
}

function luhnCheckSum(digitString) {
  const odd = value => value % 2 === 1;
  const even = value => value % 2 === 0;

  digitString = digitString.replace(/\D/g, '');

  const digits = [...digitString].map(digit => Number(digit));
  const replaceDigits = digits.map((digit, index) => {
    if ((odd(index) && odd(digits.length)) ||
        (even(index) && even(digits.length))) {
      return double(digit);
    } else return digit;
  });

  return replaceDigits.reduce((sum, digit) => sum + digit, 0);
}

function validLuhn(number) {
  const odd = value => value % 2 === 1;
  const even = value => value % 2 === 0;
  const cleanNumber = number.replace(/\D/g, '');

  if (cleanNumber === '') return false;

  const digits = [...cleanNumber].map(digit => Number(digit));
  const luhnDigits = digits.map((digit, index) => {
    if ((odd(index) && odd(digits.length)) ||
        (even(index) && even(digits.length))) {
      return double(digit);
    } else return digit;
  });

  const checkSum = luhnDigits.reduce((sum, digit) => sum + digit, 0);
  return (checkSum % 10 === 0);
}

console.log(validLuhn('0')); // true

console.log(validLuhn('2323 2005 7766 3554')); // true
console.log(validLuhn('232 3 2--005 77-66 3554')); // true
console.log(validLuhn('2323 2005sgea7766 3554')); // true
console.log(validLuhn(' 2323 2005 \n7766 3554')); // true

console.log(validLuhn('2323 42 2005 7766 3554')); // true
console.log(validLuhn('2323 32 2005 7766 3554')); // false

console.log(validLuhn('3 2323 2005 7766 3554')); // false
console.log(validLuhn('18 2323 2005 7766 3554')); // true
console.log(validLuhn('59 2323 2005 7766 3554')); // true
console.log(validLuhn('0117 2323 2005 7766 3554')); // true
console.log(validLuhn('59 2323 2005 7766 3554')); // true

console.log(validLuhn('23233554')); // true
console.log(validLuhn('2005 7766 ')); // true

console.log(validLuhn('')); // false
console.log(validLuhn('asge ges235ag - ')); // false
console.log(validLuhn('')); // false

// Additonal Requirement:

/**
 * Write a function that can add a check digit to make the number valid per the Luhn formula
 * 
 * Problem: Given a string with digits, return that same string plus an additional digit which makes it a valid Luhn number
 * 
 * Q: If the number is already valid -> return same string
 * Q: If the number has special characters -> preserve the string and just add the digit to the end
 * Q: Is there always one single solution
 * Q: Invalid inputs? blank string? no numbers/ => undefined
 * 
 * DS and A
 * - Return undefined if any invalid input
 * - |String with digits|
 * - |integer checkSum of string|
 * - If it is divisible by 10, return the original string
 * - If it is not divisible by 10,
 *  - Calculate the checksum of the digits with 0 added to the end
 */



function makeValidLuhn(string) {
  const invalidInput = string => (typeof(string) !== 'string') || (/[0-9]/.test(string) === false);

  if (invalidInput(string)) return undefined;

  const digits = string.replace(/[\D]/g, '');
  if (luhnCheckSum(digits) % 10 !== 0) {
    const shiftedCheckSum = luhnCheckSum(digits+'0');
    const missingDigit = 10 - shiftedCheckSum % 10;
    return string + `${missingDigit}`
  } else return string;
}


console.log(makeValidLuhn('asdfasdgsg eagesg')); // undefined
console.log(makeValidLuhn('')); // undefined
console.log(makeValidLuhn(' ')); // undefined
console.log(makeValidLuhn(1230)); // undefined
console.log(makeValidLuhn('2323 2005 7766 355')); // '2323 2005 7766 3554'
console.log(makeValidLuhn('2323 2005 7766 3554')); // '2323 2005 7766 3554'
console.log(makeValidLuhn('2323 2005 7766 355-')); // '2323 2005 7766 355-4'
console.log(makeValidLuhn('2323 2005 7766 355-4')); // '2323 2005 7766 355-4'

console.log(makeValidLuhn('2323 2005 7766 351')); // '2323 2005 7766 3513' ?


console.log(luhnCheckSum('2323200577663510'))
console.log(luhnCheckSum('2323 2005 7766 3511'));
console.log(luhnCheckSum('2323200577663511'));
console.log(luhnCheckSum('2323200577663513'));

console.log(makeValidLuhn('2323 2005 7766 3512')); // '2323 2005 7766 3512' ?
console.log(makeValidLuhn('2324'));
