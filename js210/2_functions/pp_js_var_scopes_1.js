// // Problem 1

// let a = 'outer';

// function testScope() {
//   let a = 'inner'; // Creates a new function-scoped variable a that shadows the 'outer' a
//   console.log(a);
// }

// console.log(a); // 'outer' global variable a
// testScope(); // 'inner'
// console.log(a); // 'outer'

// Problem 2

// let a = 'outer';

// function testScope() {
//   a = 'inner'; // reassignment of global variable a to 'inner'
//   console.log(a);
// }

// console.log(a); // 'outer' global variable a
// testScope(); // 'inner'
// console.log(a); // 'inner'

// Problem 3

// let basket = 'empty'; //global variable initialization and assignment

// function goShopping() {
//   function shop1() {
//     basket = 'tv'; // basket refers to global variable, reassigns to 'empty' when executed
//   }

//   console.log(basket); // 2 - logs global variable assigned to 'empty'

//   let shop2 = function() {
//     basket = 'computer';
//   }; // function expression

//   const shop3 = () => {
//     let basket = 'play station';
//     console.log(basket);
//   }; // function expression with const

//   shop1(); // 3 - invokes shop1 which reassigns global basket to 'tv'
//   shop2(); // 4 - invokes shop2 which has been assigned to function object. that function when called reassigns basket to 'computer'
//   shop3(); // 5 - invokes const shop3 which has been assigned to function object. Creates a function scoped variable basket for 'play station' and logs it

//   console.log(basket); // 6 - logs global variable basket which at this point is 'computer'
// }

// goShopping(); // 1) function invoked creates function execution context

// 4)
// function hello() {
//   a = 'hi'; // importantly this a becomes a property of the global object
// }

// hello(); // creates a global variable a initialized to 'hi'
// console.log(a); // prints 'hi'

// 5)

// function hello() {
//   let a = 'hello';
// }

// hello();
// console.log(a); // ReferenceError, no a in global scope

// 6)
// console.log(a);

// var a = 1; // declaration of a is hoisted and set to undefined before this line, so undefined will be printed

// 7)
// console.log(a); // a is hoisted but in Temporal Dead Zone, so referenceable but will throw an error that it hasn't been initialized

// let a = 1;

// 8)
console.log(a); // hello() not called, so no global variable a, referenceerror

function hello() {
  a = 1;
} // function declaration hoisted