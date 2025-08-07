// 1)

// function say() {
//   if (false) {
//     var a = 'hello from inside a block';
//   }

//   console.log(a); // when invoked, a declaration has been hoisted/made available at function level, but it's never assigned, should log undefined
// }

// say();

// 2)

// function say() {
//   if (false) {
//     let a = 'hello from inside a block';
//   }

//   console.log(a); // a is block scoped so at this level there is no a available, referenceerror
// }

// say();

// 3)
// function hello() {
//   a = 'hello';
//   console.log(a);

//   if (false) {
//     var a = 'hello again';
//   }
// }

// hello(); // a is NOT created as global variable with 'hello' - a has been hoisted bc of the if clause.
// console.log(a); // referenceerror, no global var a

// 4)
// function hello() {
//   a = 'hello';
//   console.log(a);

//   if (false) {
//     let a = 'hello again';
//   }
// }

// hello(); // a is created as a global variable this time - the hoisting of a in the if clause is only at block level, so line 40 is not assignment.
// console.log(a); // 'hello', accesses the a created in global scope

// 5)
// var a = 'hello';

// for (var index = 0; index < 5; index += 1) {
//   var a = index;
// }

// console.log(a); // 4, javascript treats line 55 as assignment as opposed to let and const which would throw an error for trying to declare an existing var. Implementation of var problematic bc can cause unintended assignment of same name global variables

// 6) 

// let a = 'hello';

// for (let index = 0; index < 5; index += 1) {
//   let a = index; //this is different from line 62 a, block scoped
// }

// console.log(a); //hello

// 7)

// let a = 1;

// function foo() {
//   a = 2; // reassigns global a to 2
//   let bar = function() {
//     a = 3;
//     return 4;
//   };

//   return bar(); // return the value returned by invocation of bar. That invocation reassigns global a to 3 and returns 4
// }

// console.log(foo()); // logs 4
// console.log(a); // logs 3

// 8)
// var a = 'global';

// function checkScope() {
//   var a = 'local'; // before invocation, global var a has been set to 'global'. However, this creates a function scoped local variable a that shadows the global var. 
//   const nested = function() { // assignment with function expression
//     var a = 'nested'; //when called by 102, at this point this is still the function var a 'local', which is assigned to 'nested'.
//     let superNested = () => { // another function expression declared with block scope that has function scope.
//       a = 'superNested'; // reassigns the global to 'superNested' when called by 99
//       return a; // 'superNested'
//     };

//     return superNested(); //returns invocation of superNested
//   };

//   return nested(); // calls the function object
// }

// console.log(checkScope()); //invokes checkScope and logs return value
// console.log(a);


// 9)
// let a = 'outer';
// let b = 'outer';

// console.log(a); // 'outer'
// console.log(b); // 'outer'
// setScope(a); // passes a by value, bound via parameter foo to local variable foo. also reassigns global b to 'inner'
// console.log(a); // 'outer'
// console.log(b); // 'inner'

// function setScope(foo) {
//   foo = 'inner';
//   b = 'inner';
// }

// 10)
// let total = 50;
// let increment = 15;

// function incrementBy(increment) {
//   total += increment;
// }

// console.log(total); // 50
// incrementBy(10); // calls incrementBy with 10 as arg. line 129 adds 10 to the global var to make it 60
// console.log(total); // 60
// console.log(increment); // 15 - the parameter increment creates a local variable of that name scoped to the function.

// 11)

let a = 'outer';

console.log(a); // outer
setScope(); // calls setScope - at this point though setScope has been declared as a global variable and set to undefined, but the assignment to the function expression hasn't happened yet. Throws an error that setScope is not a function. Note that if 145 has let instead of var, would get the error for trying to access a temporal dead zone variable
console.log(a);

var setScope = function () {
  a = 'inner';
};