// Write a function that takes an array argument and returns a new array that contains all the argument's elements in their original order followed by all the argument's elements in reverse order.

// function originalAndReverse(array){
//   const output = [];
//   for (let index = array.length - 1; index >= 0; index -= 1){
//     output.unshift(array[index]);
//     output.push(array[index]);
//   }
//   return output;
// };

let originalAndReverse = array => array.concat(array.slice().reverse());

console.log(originalAndReverse([1,2,3]));

// Use the array sort method to create a function that takes an array of numbers and returns a new array of the numbers sorted in descending order. Do not alter the original array.

function sortDescending(arr) {
  return arr.slice().sort((a, b) => b - a);
}

let array = [23, 4, 16, 42, 8, 15];
let result = sortDescending(array);
console.log(result);                 // logs    [42, 23, 16, 15, 8, 4]
console.log(array);                  // logs    [23, 4, 16, 42, 8, 15]

// Write a function that takes an array of arrays as an argument, and returns a new array that contains the sums of each of the sub-arrays.

function matrixSums(arr) {
  return arr.map(subarray => subarray.reduce((sum, element) => sum + element ));
}

console.log(matrixSums([[2, 8, 5], [12, 48, 0], [12]]));  // returns [15, 60, 12]

// Write a function that takes an array, and returns a new array with duplicate elements removed.

function uniqueElements(arr) {
  const uniqueArray = [];
  for (let index = 0; index < arr.length; index += 1) {
    if (uniqueArray.indexOf(arr[index]) === -1) {
      uniqueArray.push(arr[index]);
    }
  }

  return uniqueArray;
}

console.log(uniqueElements([1, 2, 4, 3, 4, 1, 5, 4]));  // returns [1, 2, 4, 3, 5]
