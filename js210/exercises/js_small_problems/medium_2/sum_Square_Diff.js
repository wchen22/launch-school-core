// Sum Square - Square Sum
// Write a function that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.

// Examples:

function solution(n) {
  const squared = num => num ** 2;
  const summed = array => array.reduce((total, num) => total + num);

  const positiveInts = new Array(n).fill(0).map((_, index) => index + 1);

  const squareOfSums = squared(summed(positiveInts));
  const sumOfSquares = summed(positiveInts.map(squared));

  return squareOfSums - sumOfSquares;
}

function sumSquareDifference(n) {
  console.log(solution(n));
}

sumSquareDifference(3);      // 22 --> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
sumSquareDifference(10);     // 2640
sumSquareDifference(1);      // 0
sumSquareDifference(100);    // 25164150