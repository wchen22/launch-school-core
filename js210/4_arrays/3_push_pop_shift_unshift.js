// Write a function named push that accepts two arguments: an Array and any other value. The function should append the second argument to the end of the Array, and return the new length of the Array.

// let push = (array, value) => {
//   array[array.length] = value;
//   return array.length;
// }

// let count = [0, 1, 2];
// push(count, 3);         // 4
// console.log(count);                  // [ 0, 1, 2, 3 ]

// Write a function named pop that accepts one argument: an Array. The function should remove the last element from the array and return it.

// let pop = function(array) {
//   if (array.length === 0) {
//     return undefined;
//   }

//   let lastVal = array[array.length - 1];
//   array.length = array.length - 1;
//   return lastVal;
// }

// let count = [1, 2, 3];
// pop(count);             // 3
// console.log(count);                  // [ 1, 2 ]

// Write a function named unshift that accepts two arguments: an Array and a value. The function should insert the value at the beginning of the Array, and return the new length of the array. You will need a for loop for this problem.

// const unshift = (array, value) => {
  // let temp;
  // let hotSeat = value;
  // array.length += 1;
  // for(let index = 0; index < array.length; index += 1){
  //   temp = array[index];
  //   array[index] = hotSeat;
  //   hotSeat = temp;
  // }

//   for (let index = array.length; index >= 0; index -=1){
//     array[index] = array[index - 1];
//   }

//   array[0] = value;
//   return array.length;
// }

// let count = [1, 2, 3];
// console.log(unshift(count, 0));      // 4
// console.log(count);                  // [ 0, 1, 2, 3 ]


// Write a function named shift that accepts one argument: an Array. The function should remove the first value from the beginning of the Array and return it.

const shift = array => {
  let firstVal = array[0];

  if (array.length === 0) {
    return undefined;
  }

  for (let index = 0; index < array.length - 1; index += 1){
    array[index] = array[index + 1];
  }

  array.length -= 1;
  return firstVal;
}

let count = [1, 2, 3];
console.log(shift(count));           // 1
console.log(count);                  // [ 2, 3 ]
