// Check Triple Match
// You have an ordered array nums consisting of integers. Your task is to determine whether there are any two distinct elements in the array where one element is exactly three times the value of the other element. The time complexity of the solution should be O(N).

// Restrictions:

// You should not use built-in methods like filter, map, reduce, or find.
// Do not use the includes method for checking existence in the array.
// Avoid using indexOf or lastIndexOf.
// Example test cases:

function checkTripleMatch(array) {
  let anchor = 0;
  let runner = 1;

  while (runner < array.length) {
    let tripled = 3 * array[anchor];
    if (tripled > array[runner]) {
      runner += 1
    } else if (tripled < array[runner]) {
      anchor += 1;
    } else return true;
  }
  return false;
}

console.log(checkTripleMatch([1, 3, 9, 28]) === true); // 28 / 1 = 28, too big.  28/3 for 9ish, 9/1 for 9ish.
console.log(checkTripleMatch([2, 3, 9, 28]) === true); // 2 , 3 is too small. 2, 9 is too big. increase starter to 3, 9 .
console.log(checkTripleMatch([1, 2, 4, 10, 11, 12]) === true); // 1, 2 too small. 1, 4 too big. 2, 4 too small. 2, 10 too big. 4, 10 too small. 
console.log(checkTripleMatch([0, 5, 7, 55]) === false);
console.log(checkTripleMatch([4, 5, 7, 9, 13, 15, 17]) === true); // 4, 5 too small. 4, 7 too small. 4, 9 too small. 4, 13 too big. 5, 13 too small. 5, 15 works.
console.log(checkTripleMatch([2, 6, 13, 54]) === true);
console.log(checkTripleMatch([1, 5, 17, 51]) === true);
console.log(checkTripleMatch([1, 2, 4, 8]) === false);

// All test cases should log true.