// Write a function that takes a sorted array of integers as an argument, and returns an array that includes all the missing integers (in order) between the first and last elements of the argument.

function missing(array) {
  const missingNumbers = [];
  const start = array[0] + 1;
  const end = array[array.length - 1] - 1;

  for (let num = start; num <= end; num += 1) {
    if (array.indexOf(num) === -1) {
      missingNumbers.push(num);
    }
  }

  return missingNumbers;
}


console.log(missing([-3, -2, 1, 5]));                  // [-1, 0, 2, 3, 4]
console.log(missing([1, 2, 3, 4]));                    // []
console.log(missing([1, 5]));                          // [2, 3, 4]
console.log(missing([6]));                             // []