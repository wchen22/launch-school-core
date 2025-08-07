// Given an array `nums` sorted in ascending order, determine
// the minimum between the count of positive integers and the
// count of negative integers.

// Please note that the number `0` is neither positive nor negative.

/*
Binary search for index of zero, or index where that would happen
if zero found, count positive is the # of elements to right, negative is elements to left

if index where zero would go, count positive is # to right +1, negative is elements to left

ah, but multiple zeros - need to find leftmost 0 and rightmost 0
*/

function minimumCount(array) {
  let leftMostZero = findLeftMostIndex(array, 0);
  let rightMostZero = findRightMostIndex(array, 0);

  let positiveCount;
  let negativeCount;
  if (rightMostZero !== -1) {
    positiveCount = array.length - rightMostZero - 1;
    negativeCount = leftMostZero;
  } else {
    let zeroPosition = findZeroPosition(array);
    positiveCount = array.length - zeroPosition;
    negativeCount = zeroPosition;
  }
  return Math.min(positiveCount, negativeCount);
}

function findZeroPosition(array) {
  let left = 0;
  let right = array.length - 1;
  while (left <= right) {
    let mid = Math.floor((left + right) / 2)
    if (array[mid] === 0) {
      return mid;
    } else if (array[mid] < 0) {
      left = mid + 1
    } else {
      right = mid - 1
    }
  }
  return left;
}

function findLeftMostIndex(array, target) {
  let leftMost = -1;
  let left = 0;
  let right = array.length - 1;
  while (left <= right) {
    let mid = Math.floor((left + right) / 2)
    if (array[mid] === target) {
      leftMost = mid;
      right = mid - 1;
    } else if (array[mid] < target) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }
  return leftMost;
}

function findRightMostIndex(array, target) {
  let rightMost = -1;
  let left = 0;
  let right = array.length - 1;
  while (left <= right) {
    let mid = Math.floor((left + right) / 2)
    if (array[mid] === target) {
      rightMost = mid;
      left = mid + 1;
    } else if (array[mid] < target) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }
  return rightMost;
}


console.log(minimumCount([-4, -3, -2, -1, 3, 4]) === 2);
console.log(minimumCount([-3, 1, 2, 3, 4, 5]) === 1);
console.log(minimumCount([-5, -4, -3, -2, -1]) === 0);
console.log(minimumCount([1, 2, 3, 4, 5]) === 0);
console.log(minimumCount([-2, -1, 1, 2]) === 2);
console.log(minimumCount([-7, -5, -4, 1, 2, 6, 10]) === 3);
console.log(minimumCount([-3, -2, -1, 0, 5, 6]) === 2);
console.log(minimumCount([-1, 0, 1]) === 1);
console.log(minimumCount([]) === 0);

// All test cases should log true.