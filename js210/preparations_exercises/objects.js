// Given the following code, how can you access the name of the person?

// let person = {
//   name:       'Bob',
//   occupation: 'web developer',
//   hobbies:    'painting',
// };
// console.log(person.name);
// console.log(person['name']);
// person[undefined] = 'hi';
// person[1] = 'hello';
// console.log(person);


// Which of the following values are valid keys for an object?

// 1
// '1'
// undefined
// 'hello world'
// true
// 'true'

// all are valid (in the sense that setting via bracket notation will work), but non-string values will be coerced such that 1 and '1' would create the same key.


// Use object literal syntax (e.g., { key: value, ... } notation) to create an object that behaves as an array in a for statement. The object should contain at least 3 elements. You should place your code between the braces in the let statement:

// let myArray = {
//   0: 'a',
//   1: 'b',
//   2: 'c',
//   length: 3,
// };

// for (let i = 0; i < myArray.length; i += 1) {
//   console.log(myArray[i]);
// }
// Hint

// Create an array from the keys of the object obj below, with all of the keys converted to uppercase. Your implementation must not mutate obj.

// let obj = {
//   b: 2,
//   a: 1,
//   c: 3,
// };

// let objKeys = Object.keys(obj).map(key => key.toUpperCase());
// console.log(objKeys);
// console.log(obj);
// The order of the array does not matter.


// Create a new object named myObj that uses myProtoObj as its prototype.

// let myProtoObj = {
//   foo: 1,
//   bar: 2,
// };
// let myObj = Object.create(myProtoObj);

// Which of the following values are primitive values? Which are objects? Which are neither?

// "foo" // primitive string
// 3.1415 // primitive number
// [ 'a', 'b', 'c' ] // object (array)
// false // primitive (boolean)
// foo // neither, identifier (which can be a variable or function name)
// function bar() { return "bar"; } // object (function)
// undefined // primitive
// { a: 1, b: 2 } // object



// Add a qux property with value 3 to the myObj object we created in the previous exercise. Now, examine the following code snippets:

// myObj.qux = 3;

// // Snippet 1
// let objKeys = Object.keys(myObj);
// objKeys.forEach(function(key) {
//   console.log(key);
// });
// // Snippet 2
// for (let key in myObj) {
//   console.log(key);
// }
// Without running this code, can you determine whether these two snippets produce the same output? Why?
// the first one creates an array of keys; however, the Object.keys method will only contain keys for which the object has on its own and not any prototypical keys, so will log just qux. The second uses for in which iterates over all keys including prototype keys.

// 8) Create a function that creates and returns a copy of an object. The function should take two arguments: the object to copy and an array of the keys that you want to copy. Do not mutate the original object.

// The function should let you omit the array of keys argument when calling the function. If you do omit the argument, the function should copy all of the existing keys from the object.

// Here are some examples for your reference:

// function copyObj(object, keys){
//   if (!keys) return Object.assign({}, object);

//   let filteredObj = {};
//   keys.forEach(key => filteredObj[key] = object[key]);
//   return filteredObj;
// }

// let objToCopy = {
//   foo: 1,
//   bar: 2,
//   qux: 3,
// };

// let newObj = copyObj(objToCopy);
// console.log(newObj);        // => { foo: 1, bar: 2, qux: 3 }

// let newObj2 = copyObj(objToCopy, [ 'foo', 'qux' ]);
// console.log(newObj2);       // => { foo: 1, qux: 3 }

// let newObj3 = copyObj(objToCopy, [ 'bar' ]);
// console.log(newObj3);       // => { bar: 2 }




// 9) What does the following program log to the console? Why?

// let foo = {
//   a: 'hello',
//   b: 'world',
// };

// let qux = 'hello';

// function bar(argument1, argument2) {
//   argument1.a = 'hi';
//   argument2 = 'hi';
// }

// bar(foo, qux);

// console.log(foo.a);
// console.log(qux);

// bar is invoked with foo and qux as arguments. Object referenced by foo is assigned to argument1, and dot notation is used to set the property with key 'a' to 'hi'. String referenced by qux is a primitive, so it is passed to argument2 by value, and thus assignment there does not change outer qux to 'hi'. foo.a logged will output 'hi', qux will output 'hello'.


// 10) How many primitive values are there in the following expression? Identify them. How many objects are there in the expression? Identify those objects.

// [1, 2, ["a", ["b", false]], null, {}]
// 1, 2, "a", "b", false, null are the six primitives
// There are 4 objects - innermost array, array enclosing that, object on the same level, and finally the outermost array.

// 11) Write some code to replace the value 6 in the following object with 606:

// let obj = {
//   foo: { a: "hello", b: "world" },
//   bar: ["example", "mem", null, { xyz: 6 }, 88],
//   qux: [4, 8, 12]
// };

// You don't have to search the object. Just write an assignment that replaces the 6.

// obj.bar[3].xyz = 606;

// console.log(obj);


// 12) Consider the following code:

// function foo(bar) {
//   console.log(bar, bar, bar);
// }

// let bar = foo; // create an alias

// foo("hello"); // should print "hello hello hello"
// bar("hi");    // should print "hi hi hi"
// As written, this code will raise an error on line 6. Without creating a new function or changing lines 5 or 6, update this code to work as intended.


// 13) Consider the following code:

// function qux(something){
//   return function() {return something};
// }
// function foo(bar) {
//   console.log(bar());
// }

// foo(qux('Welcome'));    // Should print 'Welcome'
// foo(qux(3.1415));    // Should print 3.1415
// foo(qux([1,2,3]));    // Should print [1, 2, 3]
// As written, this code will raise an error on line 5. Without modifying the function definition of foo, update this code to print the desired text.

// Need a bar function - has to be inside the function. If inside the function, will overwrite the local variable bar set to undefined when foo() is called. If outside, the local variable bar will shadow it, and there will be an error thrown. However, problem specifies that function def of foo shouldn't be modified - therefore we have to pass in the function as an argument.



// 14) Identify all of the variables, object property names, primitive values, and objects shown in the following code (assume the code has not been executed). Don't panic if you miss a few items - this exercise is more challenging than it looks.

// function hello(greeting, name) {  
//   return greeting + ' ' + name;
// }

// function xyzzy() {
//   return { a: 1, b: 2, c: [3, 4, 5], d: {} };
// }

// const howdy = hello('Hi', 'Grace');
// let foo = xyzzy();

// variables: hello, greeting, name, xyzzy, howdy, foo
// object property names: a, b, c, d
// primitive values: ' ', a, 1, b, 2, c, 3, 4, 5, d, 'Hi', 'Grace'
// objects: hello, xyzzy, { a: 1, b: 2, c: [3, 4, 5], d: {} }, {}

// Ah, technically missed 0, 1, 2 as object property names and primitives for array indices. Also worth noting that 'Hi Grace' wouldn't be a primitive b/c of stipulation that we have not run the code yet, so the function returning it wouldn't have been invoked.

// 15) Identify all of the variables, object property names, primitive values, and objects in the following code. This problem is even more challenging than the previous one.

// function bar(arg1, arg2) {
//   let foo = 'Hello';
//   const qux = {
//     abc: [1, 2, 3, [4, 5, 6]],
//     def: null,
//     ghi: NaN,
//     jkl: foo,
//     mno: arg1,
//     pqr: arg2,
//   };

//   return qux;
// }

// let result = bar('Victor', 'Antonina');
// Note that some items in this program may appear in multiple categories.

// variables: bar, arg1, arg2, foo, qux, result
// primitives: 'Hello', 'abc', 1, 2, 3, 4, 5, 6 (array values); 0, 1, 2, 3 (array indices); 0, 1, 2 (array indices for nested array); 'def', null, NaN, 'ghi', 'jkl', 'mno', 'pqr', 'Victor', 'Antonina'
// object property names: abc, def, ghi, jkl, mno, pqr, 0 1 2 3, 0 1 2
// objects: bar function, [4, 5, 6]; [1, 2, 3, [4, 5, 6]], {
//     abc: [1, 2, 3, [4, 5, 6]],
//     def: null,
//     ghi: NaN,
//     jkl: foo,
//     mno: arg1,
//     pqr: arg2,
//   }

