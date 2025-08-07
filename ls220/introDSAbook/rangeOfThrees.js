function findRange(array) {
  return [findLeftMostIndex(array, 3), findRightMostIndex(array, 3)];
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
console.log(findLeftMostIndex([-2, -1, 0, 1, 3, 9, 11], 3))

console.log(findRange([-2, -1, 3, 5, 7, 9, 11])); // [2, 2]
console.log(findRange([-7, -5, -3, 0, 2])); // [-1 -1]
console.log(findRange([1, 2, 3, 3, 3, 3, 3, 4, 5])) // [2, 6]
console.log(findRange([3, 3, 3, 3, 3])) // [0, 4]


