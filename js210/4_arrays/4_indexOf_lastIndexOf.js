// Write a function indexOf that accepts two arguments: an array and a value. The function returns the first index at which the value can be found, or -1 if the value is not present.

function indexOf(array, value) {
  for (let index = 0; index < array.length; index += 1) {
    if (array[index] === value) {
      return index;
    }
  }
  return -1;
}

console.log(indexOf([1, 2, 3, 3], 3));         // 2
console.log(indexOf([1, 2, 3], 4));            // -1

// Write a function lastIndexOf that accepts two arguments: an array and a value. The function returns the last index at which the value can be found in the array, or -1 if the value is not present.

function lastIndexOf(array, value){
  for (let index = array.length - 1; index >= 0; index -=1){
    if (array[index] === value){
      return index;
    }
  }
  return -1;
}

console.log(lastIndexOf([1, 2, 3, 3], 3));     // 3
console.log(lastIndexOf([1, 2, 3], 4));        // -1