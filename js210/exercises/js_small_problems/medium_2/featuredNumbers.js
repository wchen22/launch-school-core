// Next Featured Number Higher than a Given Value
// A featured number (something unique to this exercise) is an odd number that is a multiple of 7, with all of its digits occurring exactly once each. For example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

// Write a function that takes an integer as an argument and returns the next featured number greater than the integer. Issue an error message if there is no next featured number.

// NOTE: The largest possible featured number is 9876543201.

// Examples:

/*
RULES:
A featured number:
- Digits are unique
- Multiple of 7
- Odd
Given an integer argument, return the next greatest featured number

DATA STRUCTURE AND ALGORITHM
- Input any integer number
  - Use rules to generate the next greatest featured number
    > Find next odd multiple of 7
    > Are all digits are unique?
      > Yes -> return
      > No -> Add 14 and check again

- Return error message if integer is greater than 9876543201
- Starting with integer input
- Reassign to the next odd multiple of 7
- Until the number's digits are unique or 9876543201
- Return number


*/

function solution(number) {
  const MAX_FEATURED = 9876543201;
  if (number >= MAX_FEATURED) {
    return "There is no possible number that fulfills those requirements."
  };

  let start = nextOddMultipleOf7(number);

  for (let number = start; number <= MAX_FEATURED; number += 14) {
    if (hasUniqueDigits(number)) return number;
  }
}

function nextOddMultipleOf7(number) {
  let nextMultiple =  7 * Math.floor(number / 7) + 7;
  return nextMultiple % 2 === 0 ? nextMultiple + 7 : nextMultiple;
}

function hasUniqueDigits(number) {
  let digits = [...String(number)];
  return digits.every((digit, index) => digits.indexOf(digit) === index);
}


function featured(number) {
  console.log(solution(number));
}

featured(12);           // 21
featured(20);           // 21
featured(21);           // 35
featured(997);          // 1029
featured(1029);         // 1043
featured(999999);       // 1023547
featured(999999987);    // 1023456987
featured(9876543186);   // 9876543201
featured(9876543200);   // 9876543201
featured(9876543201);   // "There is no possible number that fulfills those requirements."