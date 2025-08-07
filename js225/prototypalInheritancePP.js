// // Write a function that returns the object on a given object's prototype chain where a property is defined. See the example code below:

// function getDefiningObject(object, propKey) {
//   // if propKey is not in the object's properties, then we want to get the object's prototype and return it
//   let definingObject = object;
//   while (definingObject !== null && !definingObject.hasOwnProperty(propKey)) {
//     definingObject = Object.getPrototypeOf(definingObject);
//   }

//   return definingObject;
// }

// let foo = {
//   a: 1,
//   b: 2,
// };

// let bar = Object.create(foo);
// let baz = Object.create(bar);
// let qux = Object.create(baz);

// //console.log(baz.isPrototypeOf(qux))
// //console.log(Object.getPrototypeOf(qux));

// bar.c = 3;

// console.log(getDefiningObject(qux, 'c') === bar);     // => true
// console.log(getDefiningObject(qux, 'e'));             // => null


// Write a function to provide a shallow copy of an object. The object that you copy should share the same prototype chain as the original object, and it should have the same own properties that return the same values or objects when accessed. Use the code below to verify your implementation:

// function shallowCopy(object) {
//   let copy = Object.create(Object.getPrototypeOf(object));
//   Object.getOwnPropertyNames(object).forEach(ownProperty => {
//     copy[ownProperty] = object[ownProperty];
//   })

//   return copy;
// }

// let foo = {
//   a: 1,
//   b: 2,
// };

// let bar = Object.create(foo);
// bar.c = 3;
// bar.say = function() {
//   console.log('c is ' + this.c);
// };

// let baz = shallowCopy(bar);
// console.log(baz.a);       // => 1
// baz.say();                // => c is 3
// console.log(baz.hasOwnProperty('a'));  // false
// console.log(baz.hasOwnProperty('b'));  // false
// console.log(baz.hasOwnProperty('c'));  // true

// let a = {
//   hasOwnProperty: 1,
// };

// shallowCopy(a);   // Uncaught TypeError: object.hasOwnProperty is not a function


// Write a function that extends an object (destination object) with contents from multiple objects (source objects).

function extend(destination, ...sources) {
  // bunch of sources with contents we'd like destination to be able to access. Could chain, or create a new object with all source properties as its own
  sources.forEach(source => {
    for (let prop in source) {
      destination[prop] = source[prop];
    }
  });

  return destination;
}

let foo = {
  a: 0,
  b: {
    x: 1,
    y: 2,
  },
};

let joe = {
  name: 'Joe'
};

let funcs = {
  sayHello() {
    console.log('Hello, ' + this.name);
  },

  sayGoodBye() {
    console.log('Goodbye, ' + this.name);
  },
};

let object = extend({}, foo, joe, funcs);

console.log(object.b.x);          // => 1
object.sayHello();                // => Hello, Joe