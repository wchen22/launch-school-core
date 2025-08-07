// Oddities
// The oddities function takes an array as an argument and returns a new array containing every other element from the input array. The values in the returned array are the first (index 0), third, fifth, and so on, elements of the input array. The program below uses the array returned by oddities as part of a comparison. Can you explain the results of these comparisons?

// Examples:

function oddities(array) {
  const oddElements = [];

  for (let i = 0; i < array.length; i += 2) {
    oddElements.push(array[i]);
  }

  return oddElements;
}

console.log(oddities([2, 3, 4, 5, 6]) === [2, 4, 6]);      // false
console.log(oddities(['abc', 'def']) === ['abc']);         // false

// === relies on identity/reference equality, not value equality. So it will only return true if the two arrays reference the same object, which is not the case here.

// Array Comparison
// The array comparison function that we implemented in the Arrays lesson (Alternate link if the previous link doesn't work) implicitly assumed that when comparing two arrays, any matching values must also have matching index positions. The objective of this exercise is to reimplement the function so that two arrays containing the same values—but in a different order—are considered equal. For example, [1, 2, 3] === [3, 2, 1] should return true.

// Examples:

function areArraysEqual(array1, array2) {
  // const array1Copy = [...array1];
  // const array2Copy = [...array2];

  // array1Copy.sort();
  // array2Copy.sort();

  // for (let index = 0; index < array1Copy.length; index += 1) {
  //   if(array1Copy[index] !== array2Copy[index]) return false;
  // }

  // return true;
  if (array1.length !== array2.length) return false;

  const array2Copy = [...array2];

  for (let index = 0; index < array1.length; index += 1) {
    const matchResult = array2Copy.indexOf(array1[index]);
    if (matchResult === -1) return false;
    array2Copy.splice(matchResult, 1);
  }

  return true;
}

console.log(areArraysEqual([1, 2, 3], [1, 2, 3]));                  // true
console.log(areArraysEqual([1, 2, 3], [3, 2, 1]));                  // true
console.log(areArraysEqual(['a', 'b', 'c'], ['b', 'c', 'a']));      // true
console.log(areArraysEqual(['1', 2, 3], [1, 2, 3]));                // false
console.log(areArraysEqual([1, 1, 2, 3], [3, 1, 2, 1]));            // true
console.log(areArraysEqual([1, 2, 3, 4], [1, 1, 2, 3]));            // false
console.log(areArraysEqual([1, 1, 2, 2], [4, 2, 3, 1]));            // false
console.log(areArraysEqual([1, 1, 2], [1, 2, 2]));                  // false
console.log(areArraysEqual([1, 1, 1], [1, 1]));                     // false
console.log(areArraysEqual([1, 1], [1, 1]));                        // true
console.log(areArraysEqual([1, '1'], ['1', 1]));                    // true
console.log(areArraysEqual(['1', 1, '1'], ['1', 1, 1]));            // false