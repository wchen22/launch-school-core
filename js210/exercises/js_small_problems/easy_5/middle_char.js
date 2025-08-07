// Get the Middle Character
// Write a function that takes a non-empty string argument and returns the middle character(s) of the string. If the string has an odd length, you should return exactly one character. If the string has an even length, you should return exactly two characters.

// Examples:

function centerOf(string) {
  const middleIndex = Math.floor((string.length - 1) / 2);
  let output = string[middleIndex];

  if (string.length % 2 === 0) { output += string[middleIndex + 1]};

  return output;
}

console.log(centerOf('I Love JavaScript')); // "a"
console.log(centerOf('Launch School'));     // " "
console.log(centerOf('Launch'));            // "un"
console.log(centerOf('Launchschool'));      // "hs"
console.log(centerOf('x'));                 // "x"