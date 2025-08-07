// Name Swapping
// Write a function that takes a string argument consisting of a first name, a space, and a last name, and returns a new string consisting of the last name, a comma, a space, and the first name.

// Examples:

function swapName(name) {
  const allNames = name.split(' ');
  const lastName = allNames.splice(allNames.length - 1);
  return lastName + ", " + allNames.join(' ');
}

console.log(swapName('Joe Roberts'));    // "Roberts, Joe"

// Further Exploration
// What if the person had more than one first name? Refactor the current solution so that it can accommodate this.

console.log(swapName('Joe Adam Roberts'));    // "Roberts, Joe Adam"



