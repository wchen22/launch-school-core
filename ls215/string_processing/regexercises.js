// Regex Book: Using Regular Expressions
// 
// 1) Write a method that returns true if its argument looks like a URL, false if it does not.

function isUrl(string) {
  console.log(!!string.match(/^https?:\/\/\S+\.\S+$/));
}

isUrl('https://launchschool.com');   // -> true
isUrl('http://example.com');         // -> true
isUrl('https://example.com hello');  // -> false
isUrl('   https://example.com');     // -> false
isUrl('http://examplecom');         // -> false
isUrl('http://example.edu');         // -> true
isUrl('http://a.e');         // -> true
isUrl('http://.e');         // -> false

// 2) Write a method that returns all of the fields in a haphazardly formatted string. A variety of spaces, tabs, and commas separate the fields, with possibly multiple occurrences of each delimiter.

function fields(text) {
  console.log(text.split(/[\t ,]+/));
}

fields("Pete,201,Student");    // ['Pete', '201', 'Student']
fields("Pete \t 201   ,  TA"); // ['Pete', '201', 'TA']
fields("Pete \t 201");         // ['Pete', '201']
fields("Pete \n 201");         // ['Pete', '\n', '201']

// 3) Write a method that changes the first arithmetic operator (+, -, *, /) in a string to a '?' and returns the resulting string. Don't modify the original string.

function mysteryMath(text){
  console.log(text.replace(/[-+*/]/, '?'));
}
mysteryMath('4 + 3 - 5 = 2');
// '4 ? 3 - 5 = 2'

mysteryMath('(4 * 3 + 2) / 7 - 1 = 1');
// '(4 ? 3 + 2) / 7 - 1 = 1'

// 4) Write a method that changes every arithmetic operator (+, -, *, /) to a '?' and returns the resulting string. Don't modify the original string.

function mysteriousMath(text){
  console.log(text.replace(/[-+*/]/g,'?'))
}
mysteriousMath('4 + 3 - 5 = 2');
// '4 ? 3 ? 5 = 2'
mysteriousMath('(4 * 3 + 2) / 7 - 1 = 1');
// '(4 ? 3 ? 2) ? 7 ? 1 = 1'

// 5) Write a method that changes the first occurrence of the word apple, blueberry, or cherry in a string to danish.

function danish(text){
  console.log(text.replace(/\b(apple|blueberry|cherry)\b/, 'danish'))
}

danish('An apple a day keeps the doctor away');
// -> 'An danish a day keeps the doctor away'

danish('My favorite is blueberry pie');
// -> 'My favorite is danish pie'

danish('The cherry of my eye');
// -> 'The danish of my eye'

danish('apple. cherry. blueberry.');
// -> 'danish. cherry. blueberry.'

danish('I love pineapple');
// -> 'I love pineapple'