// Write a function that takes an array of strings and returns an array of the same string values, but with all vowels (a, e, i, o, u) removed.

// Examples:

function removeVowels(stringArray) {
  return stringArray.map(string => string.replace(/[aeiou]/ig, ''));
}

console.log(removeVowels(['abcdefghijklmnopqrstuvwxyz']));         // ["bcdfghjklmnpqrstvwxyz"]
console.log(removeVowels(['green', 'YELLOW', 'black', 'white']));  // ["grn", "YLLW", "blck", "wht"]
console.log(removeVowels(['ABC', 'AEIOU', 'XYZ']));                // ["BC", "", "XYZ"]