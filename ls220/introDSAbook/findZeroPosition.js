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

console.log(findZeroPosition([-2, -1, 3, 5, 7, 9, 11]));
console.log(findZeroPosition([-7, -5, -3, 0, 2]));

