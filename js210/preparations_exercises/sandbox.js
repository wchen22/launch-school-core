// function evenOrOdd(number) {
//   if (!Number.isInteger(number)){
//     console.log("Error: argument not an integer");
//     return;
//   }
//   output = number % 2 === 0 ? 'even' : 'odd';
//   console.log(output)
// }

// evenOrOdd(2);
// evenOrOdd(1);
// evenOrOdd(3.2);

// if (foo()) {
//   return 'bar';
// } else {
//   return qux();
// }

// function upcase(text) {
//   if (text.length > 10){
//     return text.toUpperCase();
//   } else {
//     return text;
//   }
// }

// console.log(upcase('hello'));
// console.log(upcase('hello world'));

// function numberRange(number) {
//   if (number < 0) {
//     console.log(`${number} is less than 0`);
//   } else if (number <= 50) {
//     console.log(`${number} is between 0 and 50`);
//   } else if (number <= 100) {
//     console.log(`${number} is between 51 than 100`);
//   } else {
//     console.log(`${number} is greater than 100`);
//   }
// }

// numberRange(25);
// numberRange(75);
// numberRange(125);
// numberRange(-25);

/*
false
true
3
false
3
3
undefined
null
*/


// function show(foo = undefined, bar = null) {
//   console.log(`foo is ${foo ?? 3}, bar is ${bar ?? 42}`);
// }

// show(5, 7); // foo is 5, bar is 7
// show(0, 0); // foo is 0, bar is 0
// show(4); // foo is 4, bar is 42
// show(); // foo is 3, bar is 42

// let counter = 0;
// let limit = 5;

// do {
//   console.log(counter);
//   counter += 1;
// } while (counter < limit);

// if (true) {
//   var x = 10; // This will be executed
//   function bar() {
//       console.log("This is bar");
//   }
// } else {
//   var y = 20; // This will not be executed
//   function qux() {
//       console.log("This is qux");
//   }
// }

// console.log(x); // Outputs: 10
// console.log(y); // Outputs: undefined
// bar(); // Works, because `bar()` is hoisted to the enclosing scope
// console.log(typeof qux);

// qux(); // ReferenceError: qux is not defined

console.log(typeof qux); // undefined, qux(); throws an error here because qux has been hoisted as an empty variable but not assigned to the function object.
console.log(typeof notCalled); // undefined

if (true) {
  console.log(typeof qux); // function, the full declaration has been hoisted
  function qux() {
      console.log("This is qux");
  }
} else {
  function notCalled() {
      console.log("This won't run");
  }
}

// qux(); // ReferenceError: qux is not defined
// console.log(typeof notCalled); // undefined - does this mean that there is a variable notCalled declared? 

// console.log(foo); // referenceerror, declared but not initialized
// let foo;
// console.log(foo); // undefined - so it is initialized here? 

// boo();

// function boo() {
//   console.log("Boo!");
// }


bar();

var foo = 'hello';

function bar(){
  console.log(foo);
}