// Double Char Part 1
// Write a function that takes a string, doubles every character in the string, and returns the result as a new string.

// Examples:

function repeater(string) {
  return [...string].map(char => char + char).join('');
}
console.time('test');
console.log(repeater('Hello'));        // "HHeelllloo"
console.log(repeater('Good job!'));    // "GGoooodd  jjoobb!!"
console.log(repeater(''));             // ""
console.timeEnd('test');

// Double Char Part 2
// Write a function that takes a string, doubles every consonant character in the string, and returns the result as a new string. The function should not double vowels ('a','e','i','o','u'), digits, punctuation, or whitespace.

// Examples:

function doubleConsonants(string) {
  const regex = /[^aeiouAEIOU]/;
  const output = [];
  for (let index = 0; index < string.length; index += 1){
    const char = string[index];
    output.push( regex.test(char) ? char + char : char );
  }

  return output.join('');
}

console.log(doubleConsonants('String'));          // "SSttrrinngg"
console.log(doubleConsonants('Hello-World!'));    // "HHellllo-WWorrlldd!"
console.log(doubleConsonants('July 4th'));        // "JJullyy 4tthh"
console.log(doubleConsonants(''));                // ""