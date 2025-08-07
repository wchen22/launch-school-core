// Two Sum Less Than Target
// In this problem, you're given an array of integers nums and a target integer target. Your objective is to find the maximum sum that can be obtained by adding two distinct elements from the array, where this sum is less than the target.

// Requirements:

// The input will be an array of integers, nums, and a target integer, target.
// You need to find the maximum value of nums[i] + nums[j] where i != j and nums[i] + nums[j] < target.
// If no such pair exists, return -1.
// Example test cases:

function twoSumLessThanTarget(array, target) {
  array.sort((a, b) => a - b);

  let start = 0;
  let end = array.length - 1;
  let maxSumLessThanTarget = -Infinity;

  while (start < end) {
    const currentSum = array[start] + array[end];

    if (currentSum < target) {
      if (currentSum > maxSumLessThanTarget) maxSumLessThanTarget = currentSum;
      start += 1;
    } else end -= 1;//
    
  }

  return maxSumLessThanTarget === -Infinity ? -1 : maxSumLessThanTarget;
}


console.log(twoSumLessThanTarget([3, 1, 4], 5) === 4);
console.log(twoSumLessThanTarget([8, 2, 4, 9, 5, 10, 1, 7], 16) === 15);
console.log(twoSumLessThanTarget([5, 8, 3, 2, 1], 6) === 5);
console.log(twoSumLessThanTarget([6, 8, 10, 12], 5) === -1);
console.log(twoSumLessThanTarget([1, 2, 3, 4, 5], 100) === 9);
console.log(twoSumLessThanTarget([10, 20, 30, 40, 50], 40) === 30);
console.log(twoSumLessThanTarget([7, 4, 15, 11, 21, 9], 24) === 22);
console.log(twoSumLessThanTarget([-10, -5], -3))// === -15);

// All test cases should log true