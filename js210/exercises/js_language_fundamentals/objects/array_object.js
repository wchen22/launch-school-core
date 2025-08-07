// Array Object Part 1
// What will the following code log to the console and why? Don't run the code until after you have tried to answer.

const myArray = ['a', 'b', 'c'];

console.log(myArray[0]); // 'a'
console.log(myArray[-1]); // undefined

myArray[-1] = 'd'; // sets property '-1': 'd'
myArray['e'] = 5; // property 'e': 5
myArray[3] = 'f'; // new element at index 3 'f'

console.log(myArray[-1]);  // 'd'
console.log(myArray['e']); // 5
console.log(myArray); // ['a' 'b' 'c' 'f'] // ah, also includes the properties

// Array Object Part 2
// A user wrote a function that takes an array as an argument and returns its average. Given the code below, the user expects the average function to return 5. Is the user's expectation correct? Why or why not?

const myArray2 = [5, 5];
myArray2[-1] = 5;
myArray2[-2] = 5;

function average(array) {
  let sum = 0;

  for (let i = -2; i < array.length; i += 1) { // array length is a property that is equal to number of properties with non-negative integer keys, so here it is 2
    sum += array[i]; // nonetheless, this iteration goes over the properties with -2 and -1 as keys. 
  }

  return sum / Object.keys(array).length; // sum is 20, array length is 2 - this will return 10
}

console.log(average(myArray2));

// Further Exploration
// Refactor the average function so that it returns the result that the user expected, 5.