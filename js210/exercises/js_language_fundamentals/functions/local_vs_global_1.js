//What will the following code log to the console and why? Don't run the code until after you have tried to answer.


var myVar = 'This is global';

function someFunction() {
  var myVar = 'This is local';
}

someFunction();
console.log(myVar);

var logValue = 'foo';

function logValue() {
  console.log('Hello, world!');
}

console.log(typeof logValue);