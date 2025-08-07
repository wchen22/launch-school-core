// Find Next Letter
// You're given an array, chars, of lowercase English letters sorted in ascending order, and a lowercase letter, key. Your task is to find the smallest letter in chars that is lexicographically greater than key. If no such letter exists, return the first letter in chars.

// Example test cases:

function findNextLetter(chars, key) {
  let smallestLetter = chars[0];
  let left = 0;
  let right = chars.length - 1;

  while (left <= right) {
    const mid = Math.floor(left + (right - left) / 2);

    if (chars[mid] > key) {
      smallestLetter = chars[mid];
      right = mid - 1;
    } else left = mid + 1;

  }
  return smallestLetter;
}

console.log(findNextLetter(['b', 'd', 'f'], 'a') === 'b');
console.log(findNextLetter(['b', 'd', 'f'], 'c') === 'd');
console.log(findNextLetter(['b', 'd', 'f'], 'f') === 'b');
console.log(findNextLetter(['a', 'a', 'b', 'c'], 'a') === 'b');
console.log(findNextLetter(['c', 'f', 'j'], 'c') === 'f');
console.log(findNextLetter(['a', 'c', 'f', 'h', 'i', 'j'], 'g') === 'h');
console.log(findNextLetter(['b', 'd', 'f'], 'f')); // b
console.log(findNextLetter(['b', 'd', 'f'], 'e'));// === 'e');

// All test cases should log true.


// 1, 2, 3, 15, 100, 120