// Leap Years Part 1
// In the modern era under the Gregorian Calendar, leap years occur in every year that is evenly divisible by 4, unless the year is also divisible by 100. If the year is evenly divisible by 100, then it is not a leap year, unless the year is also evenly divisible by 400.

// Assume this rule is valid for any year greater than year 0. Write a function that takes any year greater than 0 as input and returns true if the year is a leap year or false if it is not a leap year.

// Examples:
const divisibleBy400 = (num) => num % 400 === 0;
const divisibleBy100 = (num) => num % 100 === 0;
const divisibleBy4 = (num) => num % 4 === 0;

let isLeapYear = function(year) {
  let result = divisibleBy4(year) && (!divisibleBy100(year) || divisibleBy400(year))
  console.log(result);
};

isLeapYear(2016);      // true
isLeapYear(2015);      // false
isLeapYear(2100);      // false
isLeapYear(2400);      // true
isLeapYear(240000);    // true
isLeapYear(240001);    // false
isLeapYear(2000);      // true
isLeapYear(1900);      // false
isLeapYear(1752);      // true
isLeapYear(1700);      // false
isLeapYear(1);         // false
isLeapYear(100);       // false
isLeapYear(400);       // true

// Leap Years Part 2
// This is a continuation of the previous exercise.

// The British Empire adopted the Gregorian Calendar in 1752, which was a leap year. Prior to 1752, they used the Julian Calendar. Under the Julian Calendar, leap years occur in any year that is evenly divisible by 4.

// Using this information, update the function from the previous exercise to determine leap years both before and after 1752.

isLeapYear = function(year) {
  let result = divisibleBy4(year) && (year < 1752) || 
    divisibleBy4(year) && !divisibleBy100(year) || divisibleBy400(year);
  console.log(result);
};

// Examples:
console.log("Part 2");
isLeapYear(2016);      // true
isLeapYear(2015);      // false
isLeapYear(2100);      // false
isLeapYear(2400);      // true
isLeapYear(240000);    // true
isLeapYear(240001);    // false
isLeapYear(2000);      // true
isLeapYear(1900);      // false
isLeapYear(1752);      // true
isLeapYear(1700);      // true
isLeapYear(1);         // false
isLeapYear(100);       // true
isLeapYear(400);       // true