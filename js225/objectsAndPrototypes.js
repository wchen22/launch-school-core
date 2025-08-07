// Problems
// Use the method we learned above to assign foo below to a new Object with prot as its prototype.

let prot = {};

let foo = Object.create(prot);

// Use getPrototypeOf to demonstrate the prototypal relationship between prot and foo.

console.log(Object.getPrototypeOf(foo) === prot); // true

// Use isPrototypeOf to demonstrate the prototypal relationship between prot and foo.

console.log(prot.isPrototypeOf(foo) === true);

// What will the last two lines of the code below return? Why?


console.log(prot.isPrototypeOf(foo)); // true
console.log(Object.prototype.isPrototypeOf(foo)); // true
