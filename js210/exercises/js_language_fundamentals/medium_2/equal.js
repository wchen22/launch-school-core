// Equal
// Read through the following code. Currently, it does not log the expected result. Explain why this happens, then refactor the code so that it works as expected.

const person = { name: 'Victor' };
const otherPerson = person; //{ name: 'Victor' };

console.log(person === otherPerson);    // false -- expected: true

// === tests for object equality; i.e. if the operands refer to the same object in memory. Because both variables were assigned to an object using literal notation, two different objects are created. To fix, we have to assign to otherPerson the variable person, which points them both to same object.
