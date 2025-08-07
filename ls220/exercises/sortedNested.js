// Search in a Sorted Nested Array
// In this problem, you're presented with a nested array, matrix, which has two key characteristics:

// Each subarray in the matrix is sorted in ascending order.
// The first element of each subarray is larger than the final element of the preceding subarray.
// Your task is to determine whether a given integer, target, exists within this nested array.

// The time complexity of your solution should be O(log(M*N)).

// function findInNestedArray(matrix, target) {
//     let subarray = (findSubArray(matrix, target));
//     if (!subarray) return false;
//     return findTarget(subarray, target);
// }

// function findSubArray(matrix, target) {
//   let start = -1;
//   let end = matrix.length;
//   let condition = subarray => subarray.slice(-1) < target; 

//   while (end - start > 1) {
//     const mid = Math.floor(start + (end - start) / 2);
//     if (condition(matrix[mid])) { 
//       start = mid;
//     } else end = mid;
//   }

//   if (matrix[end] && matrix[end][0] <= target) return matrix[end];
//   return false;
// }

// function findTarget(subarray, target) {
//   let start = -1;
//   let end = subarray.length;

//   while (end - start > 1) {
//     const mid = Math.floor(start + (end - start) / 2)
//     if (subarray[mid] < target) {
//       start = mid;
//     } else end = mid;
//   }

//   return (subarray[end] === target);
// }

// // Example test cases:

// console.log(findInNestedArray([[4, 8, 12], [16, 20, 24], [28, 32, 36]], 20) === true);
// console.log(findInNestedArray([[3, 6, 9], [12, 15, 18], [21, 24, 27]], 27) === true);
// console.log(findInNestedArray([[1, 3, 5], [7, 9, 11], [13, 15, 17]], 19) === false);
// console.log(findInNestedArray([[10, 20, 30], [40, 50, 60], [70, 80, 90]], 10) === true);
// console.log(findInNestedArray([[15, 25, 35], [45, 55, 65], [75, 85, 95]], 5) === false);

// All test cases should return true.


// console.log("Repeat More Than Three Times");
// Given an array nums, sorted in ascending order (where elements are equal to or increase as you move through the array), determine if a specified number, target, appears more than three times in the array. The function should return true if target is found at least four times, and false otherwise.

// Example test cases:

function isTargetFrequent(array, target) {
  let start = -1;
  let end = array.length;

  while (end - start > 1) {
    let mid = Math.floor(start + (end - start) / 2);
    if (array[mid] <= target) {
      start = mid;
    } else end = mid;
  }

  if (array[start] !== target) return false; 
  let lastIndex = start;

  start = -1;
  end = array.length;

  while (end - start > 1) {
    let mid = Math.floor(start + (end - start) / 2);
    if (array[mid] < target) { 
      start = mid;
    } else end = mid;
  }

  return (lastIndex - end) >=  3;
}

// console.log(isTargetFrequent([1, 2, 3, 3, 3, 3, 4], 3) === true);
// console.log(isTargetFrequent([1, 1, 1, 1, 2, 3, 4], 1) === true);
// console.log(isTargetFrequent([1, 2, 3, 4, 5], 2) === false );
// console.log(isTargetFrequent([1, 1, 3, 4, 5], 2) === false );
// console.log(isTargetFrequent([2, 2, 2, 3, 3, 3, 4], 3) === false);
// console.log(isTargetFrequent([4, 4, 4, 4, 4, 4, 4], 4) === true);

// All test cases should log true.




// Valid Square Number
// Write a function that checks whether a given positive integer num is the result of an integer multiplied by itself, which is typically referred to as a square integer. The function should return true if num is a square integer, otherwise false. The implementation should not rely on any square root computation provided by built-in Math library.

// Hint
// Example test cases:

function isSquareInteger(num) {
  let max = Math.ceil(num / 2);

  let start = 0;
  let end = max + 1;

  while (end - start > 1) {
    const mid = Math.floor(start + (end - start) / 2);
    if (mid * mid < num) {
      start = mid;
    } else end = mid;
  }
  return (end * end === num);
}

console.log(isSquareInteger(1) === true);
console.log(isSquareInteger(4) === true);
console.log(isSquareInteger(16) === true);
console.log(isSquareInteger(14) === false);
console.log(isSquareInteger(25) === true);
console.log(isSquareInteger(26) === false);

// All test cases should log true.