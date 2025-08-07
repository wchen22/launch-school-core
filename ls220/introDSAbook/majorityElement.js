// Practice: Find a Majority Element
// In this assignment, we'll practice the techniques learned so far using the "Find a Majority Element" problem. Try to solve the problem using the naive (brute-force) approach first, and then see if you can optimize the solution.

// Problem Description
// Given an array of numbers, return its majority element.

// The majority element is the value in the array that appears
// as at least half of the elements in the array.

// It is guaranteed that only one majority element exists in the array.

function findMajority(array) {
  let counts = new Map() ;
  let majority = array.length / 2;
  for (let num of array) {
    let currentCount = counts.get(num) || 0;
    counts.set(num, currentCount + 1);
    if (counts.get(num) >= majority) return num;
  }
}

// Test Cases:

console.log(findMajority([6, 4, 4, 6, 4]) === 4);
console.log(findMajority([4, 5, 2, 5, 5, 5, 1]) === 5);
console.log(findMajority([1, 2, 1, 2, 2, 1, 2]) === 2);
console.log(findMajority([1, 2, 3, 1, 4, 4, 1, 1]) === 1);
console.log(findMajority([5, 5, 5]) === 5);

// All test cases should log true