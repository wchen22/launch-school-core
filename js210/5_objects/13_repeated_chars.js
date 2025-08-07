// Practice Problem: Repeated Characters
// Implement a function that takes a String as an argument and returns an object that contains a count of the repeated characters.

function repeatedCharacters(string) {
  const repeatedCharCounts = {};
  const chars = string.toLowerCase().split('');

  for (let char of chars) {
    if (char in repeatedCharCounts) {
      repeatedCharCounts[char] += 1;
    } else {
      repeatedCharCounts[char] = 1;
    }
  }

  for (let key in repeatedCharCounts) {
    if (repeatedCharCounts[key] === 1) {
      delete repeatedCharCounts[key];
    }
  }

  return repeatedCharCounts;
}

console.log(repeatedCharacters('Programming'));    // { r: 2, g: 2, m: 2 }
console.log(repeatedCharacters('Combination'));    // { o: 2, i: 2, n: 2 }
console.log(repeatedCharacters('Pet'));            // {}
console.log(repeatedCharacters('Paper'));          // { p: 2 }
console.log(repeatedCharacters('Baseless'));       // { s: 3, e: 2 }

// Note that repeatedCharacters does a bit more than simply count the frequency of each character: it determines the counts, but only returns counts for characters that have a count of 2 or more. It also ignores the case.

// Logic and Structure
// Hint: Test if a key exists in an object
