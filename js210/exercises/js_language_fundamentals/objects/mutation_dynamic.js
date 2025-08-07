// Mutation
// What will the following code log to the console and why? Don't run the code until after you have tried to answer.

const array1 = ['Moe', 'Larry', 'Curly', 'Shemp', 'Harpo', 'Chico', 'Groucho', 'Zeppo', [1,2,3]];
const array2 = array1;


// for (let i = 0; i < array1.length; i += 1) {
//   array2.push(array1[i]);
// }

for (let i = 0; i < array1.length; i += 1) {
  if (typeof(array1[i]) === 'string' && array1[i].startsWith('C')) {
    array1[i] = array1[i].toUpperCase();
  } else if (Array.isArray(array1[i])) {
    array1[i].push(4);
  }
}

console.log(array2); 

// Will log the original values of array1, since the second for loop mutates the elements of array1. Since they are all primitive values, array2 values are all completely different values in memory than the ones in array1.

// Further Exploration
// What would happen if an object literal was part of the array1 elements pushed to array2? Would changes made to the object literal in array1 be reflected in array2?
  // Yes, since array2 is a shallow copy. It's a shallow copy because Array.push will pass a reference of the element for object values, not a copy of the object's values.

// How would you change the code so that any changes made to array1 in the second for loop get reflected to array2?
  // Set array2 = array1


// What will the following code log to the console and why? Don't run the code until after you have tried to answer.

const myObject = {
  prop1: '123',
  prop2: '234',
  'prop 3': '345',
};

const prop2 = '456'; // sets local variable to '456'
myObject['prop2'] = '456'; // sets value of 'prop2' property to '456'
myObject[prop2] = '678'; // will create a new property in myObject whose key is the value of prop2, '456', and set the property's value to '678'

console.log(myObject[prop2]); // 678
console.log(myObject.prop2); // 456


// Further Exploration
// Here is another example. What do you think will be logged to the console this time, and why?

const myObj = {};
myObj[myFunc()] = 'hello, '; // myFunc is hoisted and available. Invoking it returns 'funcProp', which is used as a new property key in myObj with value 'hello, '.

function myFunc() {
  return 'funcProp';
}

console.log(myObj); // will output the string representation of myObj, which has one property 'funcProp': 'hello, '
myObj[myFunc()] = 'world!'; // invokes myFunc() again, returning 'funcProp'. Thus this is reassignment of that property's value since the key exists
console.log(myObj); // funcProp: 'world!'