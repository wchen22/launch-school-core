// Write a Function named myForEach that is similar to the built-in Array.prototype.forEach method. Your Function should take an array and another Function as arguments. The Function passed to myForEach should reassign a variable in the outer scope. For instance, in the code fragment below, the Function passed to myForEach reassigns the min variable.

function myForEach(array, func) {
  for (let index = 0; index < array.length; index += 1) {
    func(array[index], index, array);
  }
}

let min = Infinity;
let getMin = value => (min = value <= min ? value : min);
myForEach([4, 5, 12, 23, 3], getMin);
console.log(min);                        // 3


// Write a function that's similar to Array.prototype.filter. It takes an array and a function as arguments, and returns an array whose values are only those that the function passed returns as true.

function myFilter(array, func) {
  let filteredArray = [];

  for (let index = 0; index < array.length; index += 1) {
    if (func(array[index], index, array)) {
      filteredArray.push(array[index]);
    }
  }

  return filteredArray;
}

let isPythagoreanTriple = function (triple) {
  return Math.pow(triple.a, 2) + Math.pow(triple.b, 2) === Math.pow(triple.c, 2);
};

console.log(myFilter([{ a: 3, b: 4,  c: 5 },
          { a: 5, b: 12, c: 13 },
          { a: 1, b: 2,  c: 3 },], isPythagoreanTriple));

// returns [ { a: 3, b: 4, c: 5 }, { a: 5, b: 12, c: 13 } ]

// Write a Function named myMap that is similar to the built-in Array.prototype.map method. Your Function should take an array and another Function (the callback) as arguments, and return a new Array. The new Array's values should be the return values of the callback Function.

function myMap(array, func) {
  let result = [];

  array.forEach( value => {
    result.push(func(value));
  });

  return result;
}

let plusOne = n => n + 1;
console.log(myMap([1, 2, 3, 4], plusOne));       // [ 2, 3, 4, 5 ]

// Write a function named myReduce that's similar to the Array.prototype.reduce method. It takes an array and a function as arguments, and optionally, a third argument that serves as an initial value. If the caller omits the initial value, myReduce should use the first element of the Array as the initial value. myReduce should return the value returned by the last invocation of the callback function.

function myReduce(array, func, initial) {
  for (let index = 0; index < array.length; index += 1) {
    if (initial === undefined && index === 0) {
      initial = array[0]
      continue;
    }
    initial = func(initial, array[index], index, array);
  }

  return initial;
}

let smallest = (result, value) => (result <= value ? result : value);
let sum = (result, value) => result + value;

console.log(myReduce([5, 12, 15, 1, 6], smallest));           // 1
console.log(myReduce([5, 12, 15, 1, 6], sum, 10));            // 49


// Write a function named myOwnEvery that's similar to the Array.prototype.every method. It should take an array and a function as arguments, and return true if every element passed to the function evaluates as truthy.

function myOwnEvery(array, func) {
  array.forEach(value => {
    console.log(value);
    if(!func(value)) return false;
  })

  for (let index = 0; index < array.length; index += 1) {
    if(!func(array[index])) return false;
  }

  return true;
}

let isAString = value => typeof value === 'string';
console.log(myOwnEvery(['a', 'a234', '1abc'], isAString));       // true
console.log(myOwnEvery(['a', 4, '1abc'], isAString));       // false


let mySet = new Set();
mySet.add(1);
mySet.add(2);
mySet.add([1]);
mySet.add([1]);
console.log(mySet);
console.log(mySet.has([1]));
