let radiansToDegrees = radians => radians * 180 / Math.PI;

console.log(radiansToDegrees(1));

let negValue = -180;

console.log(Math.abs(negValue));

// You can calculate the square of a number by multiplying the number by itself. Calculating the square root takes more work. Fortunately, the Math.sqrt method makes this easier than it would otherwise be. Use this method to find the square root of 16777216.

console.log(Math.sqrt(16777216));

// Suppose, instead, that we want to calculate the 6th power of a number. We could multiply a number by itself six times with a function. However, it is easier to just use Math.pow. Math.pow takes two arguments, the base and the exponent, and returns the result. Use Math.pow to compute and log the value of 16 to the 6th power.

console.log(Math.pow(16, 6));

// Rounding numbers up or down in JavaScript is easy, but there are three methods that perform different types of rounding. Math.round takes any decimal value and rounds it to the nearest integer. If the fractional part of the number is less than 0.5, Math.round rounds the value downwards; otherwise, it rounds the value upwards. Note: if the fractional part is exactly 0.5, Math.round rounds upwards. Math.floor rounds any number downward to the next lower integer. Math.ceil rounds any number upward to the next higher integer.

// Use the appropriate method on each of these variables to return a value of 50. Make sure you use each method once.

let a = 50.72;
let b = 49.2;
let c = 49.86;

console.log(Math.floor(a));
console.log(Math.ceil(b));
console.log(Math.round(c));

// Math.random returns a random floating-point number between 0 and 1, excluding the exact value of 1. This isn't helpful on its own, since you usually want a random integer between two other integer values. Create a function that takes two arguments, a minimum and a maximum value, and returns a random integer between those numbers (including both of the numbers). Your solution should handle the scenario that the user inadvertently swaps the positions of the min and max values or the scenario that the min and max values are equal. You may assume that the user always provides the min and max values.

function randomBetween(min, max) {
  if (min > max) {
    [min, max] = [max, min];
  }

  let difference = max - min;
  let randomNumber = min + Math.floor(Math.random() * (difference + 1));
  return randomNumber;
}

console.log(randomBetween(1111,1111));