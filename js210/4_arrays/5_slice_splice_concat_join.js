// Write a function named slice that accepts three arguments: an Array, a start index, and an end index. The function should return a new Array that contains values from the original Array starting with the value at the starting index, and including all values up to but not including the end index. Do not modify the original Array.

// You may use functions that were answers to previous practice problems to complete this problem, but do not use any built-in Array methods.

let push = (array, value) => {
  array[array.length] = value;
  return array.length;
}

function slice(array, start, end){
  const slice = [];
  for (let index = start; index < end; index +=1){
    push(slice, array[index]);
  }
  return slice;
}

console.log(slice([1, 2, 3, 4, 5], 0, 2));                      // [ 1, 2 ]
console.log(slice(['a', 'b', 'c', 'd', 'e', 'f', 'g'], 1, 3));  // [ 'b', 'c' ]

// Write a function named splice that accepts three arguments: an Array, a start index, and the number of values to remove. The function should remove values from the original Array, starting with the start index and removing the specified number of values. The function should return the removed values in a new Array.

// You may use functions that were answers to previous practice problems to complete this problem, but do not use any built-in Array methods.

function splice(array, start, numberOfValues) {
  const splicedArray = [];
  // for (let times = 1; times <= numberOfValues; times += 1){
  //   // get current value at the start index, push to spliced array
  //   push(splicedArray, array[start]);

  //   // iterate over the remaining array and shift everything  
  //   for (let offset = 0; offset < array.length - start - 1; offset += 1){
  //     array[start + offset] = array[start + offset + 1];
  //   }
  //   array.length -= 1
  // }
  for (let index = start; index < array.length; index += 1) {
    if (index < start + numberOfValues) {
      push(splicedArray, array[index]);
    }
    array[index] = array[index + numberOfValues];
  }
  array.length -= numberOfValues;
  return splicedArray;
}

let count = [1, 2, 3, 4, 5, 6, 7, 8];
console.log(splice(count, 2, 5));                   // [ 3, 4, 5, 6, 7 ]
console.log(count);                                 // [ 1, 2, 8 ]

// Write a function named concat that accepts two Array arguments. The function should return a new Array that contains the values from each of the original Arrays.

// You may use functions that were answers to previous practice problems to complete this problem, but do not use any built-in Array methods.

function concat(array1, array2){
  const concatArray = [];
  for (let index = 0; index < array1.length; index +=1) {
    push(concatArray, array1[index]);
  }
  for (let index = 0; index < array2.length; index +=1) {
    push(concatArray, array2[index]);
  }

  return concatArray;
}

console.log(concat([1, 2, 3], [4, 5, 6]));       // [ 1, 2, 3, 4, 5, 6 ]

// Write a function named join that accepts two arguments: an Array and a String. The function should coerce each value in the Array to a String, and then join those values together using the second argument as a separator. You may assume that a separator will always be passed.

// You can call the String function on any JavaScript value to get its String representation.

function join(array, separator) {
  let joinedString = '';
  for (let index = 0; index < array.length; index +=1) {
    joinedString += String(array[index]);
    if (index < array.length - 1) {
      joinedString += separator;
    }
  }

  return joinedString;
}

console.log(join(['bri', 'tru', 'wha'], 'ck '));       // 'brick truck wha'
console.log(join([1, 2, 3], ' and '));                 // '1 and 2 and 3'

let arr = [];
if (arr) {
    let arr2 = [];
    console.log(arr2 == false);
    console.log(arr2 == true);
    console.log(arr == false);
}
