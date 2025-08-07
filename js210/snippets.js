// // // Theoretical example of dynamic scoping and execution context

// // // Global setting for notification verbosity
// // dynamic verbosityLevel = "normal";

// // function showNotification(message) {
// //     if (verbosityLevel == "verbose") {
// //         // Show detailed notification
// //         console.log("VERBOSE: " + message + " [Time: " + getCurrentTime() + "]");
// //     } else {
// //         // Show normal notification
// //         console.log("NOTICE: " + message);
// //     }
// // }

// // function performTask() {
// //     // Some task logic
// //     showNotification("Task completed successfully.");
// // }

// // function runPrototype() {
// //     // Temporarily change verbosity level for this execution context
// //     dynamic verbosityLevel = "verbose";

// //     performTask(); // Will display a verbose notification due to dynamic scope
// // }

// // // Execute prototype with verbose notifications
// // runPrototype();

// // // Outside runPrototype, notifications would revert to normal verbosity
// // performTask(); // Will display a normal notification


// // Closure demonstration attempt



// function createMcdonalds(location, owner) {
//   const menu = ['bigmac', 'fries', 'mcrib'];
//   const announce = function() {
//     console.log(`The McDonald's at ${location} owned by ${owner} is offering ${menu}`);
//   };

//   const addMenuItem = function(item){
//     menu.push(item);
//   };

//   return {
//     announce,
//     addMenuItem
//   };
// }

// const nycMcdonalds = createMcdonalds('NYC', 'Wilson');
// nycMcdonalds.announce();
// nycMcdonalds.addMenuItem('chicken nuggets');

// nycMcdonalds.announce();

// const multiply = function(a, b) {
//   return a * b;
// }

// const triple = function(num) {
//   return multiply(num, 3);
// }

// console.log(triple(2));

// console.log(sayHello()); // Outputs: Hello!

// var sayHello = "Hi!";


// function sayHello() {
//     return "Hello!";
// }

// console.log(sayHello); // Outputs: Hi!


// function sayHello() {
//   return "Hello!";
// }

// var sayHello; // This line is what happens due to variable hoisting
// console.log(sayHello); // [Function: sayHello]
// console.log(sayHello()); // Outputs: Hello!

// sayHello = "Hi!";

// console.log(sayHello); // Outputs: Hi!


//at this point, foo's declaration and function body is fully defined.
// console.log(foo); // => Function...
// var foo = 33;

// function foo(){
//   console.log('hi from function foo')
// };

// console.log(foo);

// console.log(bar);
// let bar = 'hello';
// //bar();            

// function bar() {
//   console.log('world');
// }

// console.log(foo);
// let foo = "hello";

// function foo() {         // SyntaxError
//   console.log("hello");
// }

// console.log(foo);


// console.log(foo);
// let foo = "hello";

// function foo() {
//   console.log("hello");
// }

// {
//   console.log(myVar); // ReferenceError: Cannot access 'myVar' before initialization

//   function myVar() {
//     console.log("Function declaration");
//   }

//   let myVar = "Let variable";

//   console.log(myVar); // Logs: "Let variable"
// }


// Question 1:

// function foo(){
//     function bar() {
//         return 3;
//     }
//     return bar();
//     function bar() {
//         return 8;
//     }
// }
// console.log(foo());

// When run, JS engine creates an execution context for the global scope. In the first phase, the creation phase, it goes line by line looking for top-level variable and function declarations. At this point, the function declaration of foo is stored in memory. Then the execution phase happens. the function declaration has already been processed (inner functions aren't processed at this point, though the function body exists in memory).

// we console.log the return value of foo(). An execution context is created for the function body now. 
  // Creation: function bar fully added to memory with return 3, then overwritten by return 8 declaration. Execution: return bar() is the only code run, returning 8. 
  // execution context destroyed
// console.log 8


// Question 2:
// function foo(){
//   var bar = function() {
//       return 3;
//   };
//   return bar();
//   var bar = function() {
//       return 8;
//   };
// }
// console.log(foo());

// Execution context created
  // Creation phase: function declaration of foo stored in memory
  // execution phase: console.log(foo()) invokes foo
    // foo() execution context created
      // Creation phase: first var bar is declared and initialized to undefined. Second var bar noticed but nothing done.
      // Execution phase: 
        // first bar assignment happens, assigning bar to function expression returning 3
        // return bar(); returns the return value of bar's execution, which at this point is 3.
  // 3 is logged


// console.log(foo());
// function foo(){
//     var bar = function() {
//         return 3;
//     };
//     return bar();
//     var bar = function() {
//         return 8;
//     };
// }

// Global execution context created
  // Creation phase: foo declaration noticed, foo function stored in memory
  // Execution phase: console.log(foo()) invokes foo, creating a new execution context
    // foo execution context
      // Creation phase: 
        // var keyword declares the variable bar and initializes it to undefined
        // second var keyword is noticed but has no effect since bar already exists, remains undefined
      // Execution phase:
        // bar is assigned to function expression with return 3 in the body
        // return bar() invokes bar, creating new execution context. Nothing needs to be done in its creation phase, the execution phase returns 3 and exits
      // return bar() returns 3 and exits
    // 3 is logged


// function foo(){
//   return bar();
//   var bar = function() {
//       return 3;
//   };
//   var bar = function() {
//       return 8;
//   };
// }
// console.log(foo());

// Global execution context
  // Creation phase: foo function stored in memory
  // Execution: console.log(foo()) creates foo execution context
    // Creation phase: bar is declared and initalized to undefined by var keyword. The second one is ignored but leaves bar initialized to undefined.
    // Execution: return bar() invokes bar, but at this point it's undefined, throwing an error

// console.log(a);
// var a = 1;
// let a = 2;

// {
//   console.log(func);
//   // TDZ starts at beginning of scope
//   const func = () => console.log(letVar); // OK

//   // Within the TDZ letVar access throws `ReferenceError`

//   let letVar = 3; // End of TDZ (for letVar)
//   func(); // Called outside TDZ!
// }

// Creation phase: 
  // const func stores func in TDZ
  // let letVar found, stored in TDZ
// Execution phase:
  // func is fully declared and assigned its function expression
  // letVar fully declared and assigned to 3
  // func() invoked, which logs letVar, logging 3

// console.log(foo) // [Function: foo]
// var foo = "hello";

// function foo() {
//   console.log("hello")
// }

let object = {
  a: 'hello',
  b: 'world',
};

object.a;                 // "hello", dot notation
object['b'];              // "world", bracket notation
object.c;                 // undefined when property is not defined

let foo = {
  a: 1,
  good: true,
  'a name': 'hello',
  person: {
    name: 'Jane',
    gender: 'female',
  },
  c: function () {        // function expression as property value
    return 2;
  },
  d() {                   // compact method syntax
    return 4;
  }
};

foo['a name'];            // "hello", use bracket notation when property name is an invalid identifier
foo['goo' + 'd'];         // true, bracket notation can take expressions
let a = 'a';
foo[a];                   // 1, bracket notation works with variables since they are expressions
console.log (foo['person'].name);          // "Jane", dot notation can be chained to "dig into" nested objects
foo.c();                  // 2, Call the method 'c'
foo.d();                  // 4, Call the method 'd'