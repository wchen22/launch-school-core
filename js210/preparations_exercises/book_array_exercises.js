// let myArray = [1, 3, 6, 11, 4, 2,
//   4, 9, 17, 16, 0];

//   myArray.forEach(function(element, index){
//     if (element % 2 === 0){
//       console.log(element);
//     }
//   });

//   for (let i = 0; i < myArray.length; i++){
//     if (myArray[i] % 2 === 1)
//     {
//       console.log(myArray[i]);
//     }
//   }


// let myArray = [
//   [1, 3, 6, 11],
//   [4, 2, 4],
//   [9, 17, 16, 0],
// ];

// for (let i = 0; i < myArray.length; i++){
//   let subArray = myArray[i];
//   for (let j = 0; j < subArray.length; j++){
//     let value = subArray[j];
//     if (value % 2 === 0) {
//       console.log(value);
//     }
//   }
// }

// myArray.forEach(function(subArray){
//   subArray.forEach(function(value){
//     if (value % 2 === 0){
//       console.log(value);
//     }
//   });
// });

// let myArray = [
//   1, 3, 6, 11,
//   4, 2, 4, 9,
//   17, 16, 0,
// ];

// let oddEven = myArray.map(function(value){
//   return (value % 2 === 0) ? "even" : "odd";
// });

// console.log(oddEven);

// function findIntegers(array){
//   return array.filter(function(value){
//     return Number.isInteger(value);
//   });
// }

// let things = [1, 'a', '1', 3, NaN, 3.1415, -4, null, false];
// let integers = findIntegers(things);
// console.log(integers); // => [1, 3, -4]
 

// Use map and filter to first determine the lengths of all the elements in an array of string values, then discard the even values (keep the odd values).

// function oddLengths(array){
//   return array.map(function(element){
//     return element.length;
//   }).filter(function(value){
//     return (value % 2 === 1);
//   });
// }

// // Arrow functions can be used when an implicit return statement is sufficient
// function oddLengths(array){
//   let lengths = array.map(element => element.length);
//   let oddLengths = lengths.filter(element => element % 2 === 1);
//   return oddLengths;
// }

// let arr = ['a', 'abcd', 'abcde', 'abc', 'ab'];
// console.log(oddLengths(arr)); // => [1, 5, 3]

// Use reduce to compute the sum of the squares of all of the numbers in an array:

// let array = [3, 5, 7];
// console.log(sumOfSquares(array)); // => 83

// function sumOfSquares(array) {
//   return array.reduce(function(sum, element){
//     return sum + element ** 2;
//   }, 0);
// }

// function sumOfSquares(array) {
//   return array.reduce(((sum, element) => sum + element ** 2), 0);
// }

// let arr = ['a', 'abcd', 'abcde', 'abc', 'ab'];
// console.log(oddLengths(arr)); // => [1, 5, 3]

// function oddLengths(array) {
//   return array.reduce(function(returnArray, string){
//     if (string.length % 2 === 1){
//       returnArray.push(string.length);
//     }
//     return returnArray;
//   },[]);
// }


// function anyThrees(array) {
//   // return array.some(number => number === 3);

//   // for (let i = 0; i < array.length; i+=1) {
//   //   let current = array[i];
//   //   if (current === 3) {
//   //     return true;
//   //   }
//   // }
//   // return false;
  
//   return array.includes(3);
// }

// let numbers1 = [1, 3, 5, 7, 9, 11];
// let numbers2 = [];
// let numbers3 = [2, 4, 6, 8];

// console.log(anyThrees(numbers1));
// console.log(anyThrees(numbers2));
// console.log(anyThrees(numbers3));


// let arr = [
//   ["hello", "world"],
//   ["example", "mem", null, 6, 88],
//   [4, 8, 12]
// ];

// arr[1][3] = 606;

// console.log(arr);

// no other code above

// let foo = function() {
//   return function() {
//     return 1;
//   }
// };

// let bar = foo();

// console.log(bar());

let foo = function() {
  // let baz = function() {
  //   return 1;
  // }

  // return baz;

  return function() {
    return 1;
  };
};

let bar = foo;
let qux = foo();

console.log(bar()); // bar is pointed to the same function referenced by foo. () invokes that function, which returns function baz
console.log(bar()()); // foo is invoked, returning baz, then baz is invoked returning 1
console.log(bar);

console.log(qux); // returns Function anonymous - is foo invoked here? or is the () telling Javascript to retrieve the return value? is there a difference?
console.log(qux()); // qux points to the return expression of foo, which is the function baz. invoking it therefore invokes the return function which returns 1, which is logged.


console.log(typeof bar);
console.log(typeof qux);


const result = (function qax() {
  return 42;
});

console.log(typeof result);
console.log(result); // Outputs: 42

const result2 = function() {
  return 42;
}();

console.log(typeof result);
console.log(result);


(function() {
  //setTimeout(function() { someFunction(); }, 10);
  (function() {someFunction();}());
  var someFunction = function() { console.log('here3'); };
  })();