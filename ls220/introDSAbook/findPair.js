// Given a list of numbers,
// find two numbers in the list that add up to ten
// and return them. If no such pair exists, return null.

// It is guaranteed that there is either exactly one pair of numbers
// that satisfies the condition, or no pairs at all.

// Test Cases:

// function findPair(array) {
//   let allPairs = pairsFrom(array)
//   let pairWithSumTen = null;
//   allPairs.forEach(pair => {
//     if (sum(pair) === 10) {
//       pairWithSumTen = pair;
//     }
//   });

//   return pairWithSumTen;
// }

function pairsFrom(array) {
  const output = [];
  array.slice(0, -1).forEach((element, index) => {
    for (let following = index + 1; following < array.length; following += 1) {
      output.push([element, array[following]]);
    }
  })

  return output;
}

function sum(array) {
  return array.reduce((sum, num) => sum + num);
}

function findPair(nums) {
  const numSet = new Set();
  const targetNumber = 10;

  for (const num of nums) {
    const complement = targetNumber - num;
    if (numSet.has(complement)) {
      return [complement, num];
    }
    numSet.add(num);
  }

  return null;
}

console.log(findPair([2, 3, 9, 7])); // Output: [3, 7]
console.log(findPair([10, 6, -1, 2])); // null
console.log(findPair([1, 2, 5, 6])); // null
console.log(findPair([1, 3, 6, 10, 4, 5])); // [6, 4]
console.log(findPair([4, -5, 3, 15, 5])); // [-5, 15]