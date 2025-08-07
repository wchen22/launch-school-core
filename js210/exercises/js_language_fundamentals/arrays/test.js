// function splice(array, start, deleteCount, ...args) {
// // If the value of start is greater than the length of the array, set it to equal the length.
//   start = Math.min(start, array.length);
// // If the value of deleteCount is greater than the number of elements from start up to the end of the array, set deleteCount to the difference between the array's length and start.
//   deleteCount = Math.min(deleteCount, array.length - start);

//   const output = [];

//   // insert any items from [args] [a b c d e] 2, 2 [x y z] (should take out c d) -> [a b c d x y z e] OR a b x y z c d e 

//   let arrayCopy = [...array]

//   // the added args can have fewer, same, or more elements than the deleted args
//   for (let index = start; index < start + args.length; index += 1) {
//     array[index + args.length+1] = array[index];
//     // console.log(array);
//     array[index] = args[index - start];
//     // console.log(array);
//   }

//   console.log(`inserted array with ${args} inserted into ${arrayCopy} at index ${start} : ${array}`);
//   // increase array length by args.length()
//   // iterate over the start index to start index + args.length
//   // set array[index + args.length] to current stored value
//   // set current stored value to current args element

//   // iterate from the start index up to start + deleteCount
//   let newStartIndex = start + args.length + 1;
//   for (let index = newStartIndex; index <= newStartIndex + deleteCount; index += 1) {
//     output.push(array[index]); // capture the values needed to be returned

//     array[index] = array[index + deleteCount];
//   }

//   array.length -= (deleteCount + 1);
//   // push into output current element
//   // set element equal to element at index + deleteCount
//   return output;

// // Takes optional arguments for elements to add to the array; denoted by the rest parameter ...args. If no elements to add are provided, splice only removes elements from the array.
  

// }

function slice(array, begin, end) {
  const output = [];
  const indexMax = Math.min(array.length, end);

  for (let index = begin; index < indexMax; index += 1) {
    output.push(array[index]);
  }

  return output;
}

function splice(array, start, deleteCount, ...toAdd) {
  const output = [];
  start = Math.min(start, array.length);
  deleteCount = Math.min(deleteCount, array.length - start);
  deleteCount = Math.max(0, deleteCount);
  const addCount = toAdd.length;

  toAdd = toAdd.concat(slice(array, start + deleteCount , array.length));

  const newLength = array.length + addCount - deleteCount;

  for (let index = start; index < Math.max(newLength, array.length); index += 1) {
    if (output.length < deleteCount) {
      output.push(array[index]);
    }
    array[index] = toAdd[index - start];
  }

  array.length = newLength;


  return output;
}
  
const arr5 = [1, 2, 3];
console.log(splice(arr5, 1, 2, 'a','b','c'));
console.log(arr5);

console.log('asdf');
console.log(splice([1, 2, 3], 1, 2));              // [2, 3]
console.log('asddf');


console.log("SPLICE");
console.log(splice([1, 2, 3], 1, 2));              // [2, 3]
console.log(splice([1, 2, 3], 1, 3));              // [2, 3]
console.log(splice([1, 2, 3], 1, 0));              // []
console.log(splice([1, 2, 3], 0, 1));              // [1]
console.log(splice([1, 2, 3], 1, 0, 'a'));         // []

const arr1 = [1, 2, 3];
splice(arr1, 1, -1);
console.log(arr1);
console.log(`test: ${arr1}`);

const arr2 = [1, 2, 3];
console.log(splice(arr2, 1, 1, 'two'));             // [2]
console.log(arr2);                                  // [1, "two", 3]


console.log(splice([1, 2, 3], 1, 3));              // [2, 3]
console.log(splice([1, 2, 3], 1, 0));              // []
console.log(splice([1, 2, 3], 0, 1));              // [1]
console.log(splice([1, 2, 3], 1, 0, 'a'));         // []

const arr3 = [1, 2, 3, 4, 5];
console.log(splice(arr3, 1, 2));    // [2, 3]
console.log(arr3);                                  // [1, "two", "three"]