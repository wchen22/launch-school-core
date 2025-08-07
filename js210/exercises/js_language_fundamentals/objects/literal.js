// Literal
// Identify the bug in the following code. Don't run the code until after you've tried to answer.

// second call will throw a reference error for no variable a in scope

const myObject = {
  a: 'name',
  'b': 'test',
  123: 'c',
  1: 'd',
};

myObject[1];
// myObject[a];
myObject.a;

// Literal Method
// In the following code, a user creates a person object literal and defines two methods for returning the person's first and last names. What is the result when the user tries out the code on the last line?

// something like function function. person.firstName returns the value with the key firstName, which in this case is the function object assigned to the variable firstName.

const person = {
  firstName() {
    return 'Victor';
  },
  lastName() {
    return 'Reyes';
  },
};

console.log(`${person.firstName} ${person.lastName}`);

function some() {

}