// Count Pairs
// In this problem, you are provided with an ascending order array of integers, nums. Your task is to count the number of pairs in this array whose sum is greater than a given target value, target.

// Constraints:

// The array nums is sorted in ascending order.
// No duplicate pairs should be counted. For instance, if nums contains [1, 2] and target is 2, then (1, 2) is a valid pair since 1 + 2 > 2. You shouldn't include (2, 1)
// Example test cases:

function countPairs(nums, target) {
  let count = 0;
  let start = 0;
  let end = nums.length - 1;

  while (start < end) {
    if (nums[start] + nums[end] > target) {
      count += end - start;
      end--;
    } else {
      start++;
    }
  }

  return count;
}

console.log(countPairs([1, 2, 3, 4, 5], 6) === 4);
// Pairs: (2, 5), (3, 4), (3, 5), (4, 5)

console.log(countPairs([1, 2, 3, 4, 5], 8) === 1);
// Pair: (4, 5)

console.log(countPairs([1, 3, 5, 7], 6) === 4);
// Pairs: (1, 7), (3, 5), (3, 7), (5, 7)

console.log(countPairs([1, 2, 3, 4], 5) === 2);
// Pairs: (2, 4), (3, 4)
// makes sense to start with the end, 3, 4
// is greater than target, so decrease start by 1 to get 2, 4, yes.
// is greater than target, so decrease start by 1 to get 1, 4, no.
  // would there be a situation where i should've decreased the end by 1 instead at this step?
  // [1 , 2,  3, 3.5, 4] 5 3.5, 4; 3, 4; 2,4; 1, 4
  // missing combo would be 2, 3.5. Upon calculating that 1, 4 doesn't work, should increase starter to 1 again and start decreasing the runner

console.log(countPairs([1, 2, 3, 4, 5], 10) === 0);
// No pairs

console.log(countPairs([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 8)) ;// target is 8