// Create a class Cat that logs the string I'm a cat! to the console whenever a new instance is created. Then instantiate a new instance of Cat and assign it to a kitty variable.

// Using the code from the previous exercise, add a parameter to constructor that provides a name for the Cat object, and assign this parameter to a property called name. If no argument is provided, the name should default to Kitty. Then, replace the I'm a cat! message with a greeting that includes the provided name.


// Solution
// Using the code from the previous exercise, move the greeting from the constructor method to an instance method named greet that logs a greeting to the console when invoked. Additionally, define one more instance method named rename that renames a Cat instance when invoked.

// Solution
// Using the code from the previous question, write any code necessary so that the string Hello! I'm a cat! is logged to the console when Cat.genericGreeting is invoked.

// Solution


// class Cat {
//   constructor(name = 'Kitty') {
//     this.name = name;
//     this.greet();
//   }

//   static genericGreeting() {
//     console.log("Hi I'm a cat");
//   }

//   greet() {
//     console.log(`I'm a ${this.name}!`)
//   }

//   rename(newName) {
//     this.name = newName;
//   }
// }

// let kitty = new Cat;
// let lion = new Cat('Leo');

// lion.rename('Simba');
// lion.greet();

// Cat.genericGreeting();


class Cat {
  constructor(name) {
    this.name = name;
  }
  speaks() {
    return `${this.name} says meowwww.`;
  }
}

let fakeCat = Object.create(Cat.prototype);// your implementation
console.log(fakeCat instanceof Cat); // logs true
console.log(fakeCat.hasOwnProperty('name')); // logs false
console.log(fakeCat.speaks()); // logs undefined says meowwww.