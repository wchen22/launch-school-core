// Practice: Compress to Distinct Elements
// In this assignment, we'll practice the techniques learned so far using the "Compress to Distinct" problem. Try to solve the problem using the naive (brute-force) approach first, and then see if you can optimize the solution.

// Problem Description

// Given a sorted array of integers, your task is to implement a function
// `compressToDistinct` that modifies the array in-place to ensure
// it starts with a sequence of distinct elements in their original order.
// After making these modifications, the function should return
// the count of these distinct elements.

// The elements in the latter part of the array, after the distinct ones, are not important.

// Example:

// If the input array is [3, 3, 5, 7, 7, 8], there are four distinct elements: 3, 5, 7, and 8.
// After modifying the array to place these distinct elements at the beginning,
// the resulting array should look like this -> [3, 5, 7, 8, _, _].
// The underscores (_) represent the elements that are no longer important.

// You should name the function `compressToDistinct` for the tests to work correctly.

function compressToDistinct(array) {
  /*
  anchor runner starting at the beginning
  if the runner is same as the anchor, increase the runner
  if the runner is diff from anchor, set anchor+1 to the runner, increase anchor by 1
  once the runner reaches the end
  fill anchor to the end with _
  */
  let anchor = 0;
  let runner = 1;

  while (runner < array.length) {
    if (array[anchor] === array[runner]) {
      runner += 1;
    } else {
      anchor += 1;
      array[anchor] = array[runner];
      runner += 1;
    }
  }

  for (let i = anchor + 1; i < array.length; i++) {
    array[i] = '_';
  }
  return anchor + 1;
}

function testCompressToDistinct(array, expectedLength) {
  const originalReference = array;
  const resultLength = compressToDistinct(array);
  const isSameObject = originalReference === array;
  const isLengthCorrect = resultLength === expectedLength;
  const isModifiedCorrectly = array.slice(0, expectedLength).every((val, idx, arr) => idx === 0 || val > arr[idx - 1]);

  return isSameObject && isLengthCorrect && isModifiedCorrectly;
}

console.log(testCompressToDistinct([3, 3, 5, 7, 7, 8], 4));
console.log(testCompressToDistinct([1, 1, 2, 2, 2, 3, 4, 4, 5], 5));
console.log(testCompressToDistinct([0], 1));
console.log(testCompressToDistinct([-5, -3, -3, -1, 0, 0, 0, 1], 5));
console.log(testCompressToDistinct([6, 6, 6, 6, 6, 6, 6], 1));

// All tests should log true.