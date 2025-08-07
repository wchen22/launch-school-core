// Write a method that returns true if its argument looks like a URL, false if it does not.

let isUrl = string => !!string.match(/^https?:\/\/\S+\.com$/);

console.log(isUrl('https://launchschool.com'));   // -> true
console.log(isUrl('https://launchschoolcom'));   // -> false
console.log(isUrl('http://example.com'));         // -> true
console.log(isUrl('https://example.com hello'));  // -> false
console.log(isUrl('   https://example.com'));     // -> false


// Write a method that returns all of the fields in a haphazardly formatted string. A variety of spaces, tabs, and commas separate the fields, with possibly multiple occurrences of each delimiter.

let fields = string => string.split(/[,\t ]+/);

console.log(fields("Pete,201,Student"));    // ['Pete', '201', 'Student']
console.log(fields("Pete \t 201   ,  TA")); // ['Pete', '201', 'TA']
console.log(fields("Pete \t 201"));         // ['Pete', '201']
console.log(fields("Pete \n 201"));         // ['Pete', '\n', '201']

// Write a method that changes the first arithmetic operator (+, -, *, /) in a string to a '?' and returns the resulting string. Don't modify the original string.

function mysteryMath(string) {
  return string.replace(/[-+*\/]/,'?');
}
console.log(mysteryMath('4 + 3 - 5 = 2'));
// '4 ? 3 - 5 = 2'
console.log(mysteryMath('(4 * 3 + 2) / 7 - 1 = 1'));
// '(4 ? 3 + 2) / 7 - 1 = 1'

// Write a method that changes every arithmetic operator (+, -, *, /) to a '?' and returns the resulting string. Don't modify the original string.
function mysteriousMath(string) {
  return string.replace(/[-+*\/]/g, "?")
}
console.log(mysteriousMath('4 + 3 - 5 = 2'));
// '4 ? 3 ? 5 = 2'
console.log(mysteriousMath('(4 * 3 + 2) / 7 - 1 = 1'));
// '(4 ? 3 ? 2) ? 7 ? 1 = 1'



// Write a method that changes the first occurrence of the word apple, blueberry, or cherry in a string to danish.

function danish(string) {
  return string.replace(/\b(apple|blueberry|cherry)\b/, "danish");
}
console.log(danish('An apple a day keeps the doctor away'));
// -> 'An danish a day keeps the doctor away'

console.log(danish('My favorite is blueberry pie'));
// -> 'My favorite is danish pie'

console.log(danish('The cherry of my eye'));
// -> 'The danish of my eye'

console.log(danish('apple. cherry. blueberry.'));
// -> 'danish. cherry. blueberry.'

console.log(danish('I love pineapple'));
// -> 'I love pineapple'