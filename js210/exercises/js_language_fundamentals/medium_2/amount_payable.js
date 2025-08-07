// Amount Payable
// What does the following code log? Why is this so?

let startingBalance = 1;
const chicken = 5;
const chickenQuantity = 7;

function totalPayable(item, quantity) {
  return startingBalance + (item * quantity);
}

startingBalance = 5;
console.log(totalPayable(chicken, chickenQuantity)); // 40

startingBalance = 10;
console.log(totalPayable(chicken, chickenQuantity)); // 45

// 40 and 45, which reflects the most recent value of startingBalance when totalPayable is invoked. This is a demonstration of how closures work in Javascript: a function retains any necessary references to objects in its lexical scope, rather than a snapshot of any object states or variable evaluations at the time of declaration or at the end of an invocation.