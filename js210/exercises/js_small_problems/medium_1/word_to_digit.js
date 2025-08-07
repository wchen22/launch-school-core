// Write a function that takes a sentence string as an argument and returns that string with every occurrence of a "number word" — 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' — converted to its corresponding digit character.

// Example:

/*
PROBLEM
- Take a sentence string and return a new one with 'number words' replaced with corresponding digit characters
Input: String

Output: Output

Rules:
- An 'occurrence' of a number word can be delimited by space and punctuation
- Valid punctuation is [-'. ,]
? Empty string input => ''
? Input without any digit words => return same string
? 'fivefivefive' => doesn't count

EXAMPLES

DATA STRUCTURES
- String replacement: use regex and replacement. Simpler to preserve punctuation this way

ALGORITHM
- Replace the string using a regex match
  - 'zero' 'one' 'two'.... etc surrounded by [-'. ,] with their corresponding digit representation

*/
var numStrings = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
var regex = new RegExp(`\\b(${numStrings.join('|')})\\b`, 'ig')

function wordToDigit(str) {
  return str.replace(regex, (match => numStrings.indexOf(match)));
}
// const digitWords = ['ZERO', 'ONE', 'TWO', 'THREE', 'FOUR', 'FIVE', 'SIX', 'SEVEN', 'EIGHT', 'NINE'];
// const digits = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].map(number => String(number));

// function replaceDigit(word) {
//   let cleanString = word.replace(/\W/g, '');
//   let digitWordsIndex = digitWords.indexOf(cleanString.toUpperCase());
//   let digit = digits[digitWordsIndex];

//   return word.replace(/[^-'. ,;]+/ , digit);
// }


// function wordToDigit(sentence) {
//   let digitWordsRegex = `(${digitWords.join('|')})`
//   let matchRegex = new RegExp(`\\b${digitWordsRegex}\\b`, "ig");
//   return sentence.replace(matchRegex, replaceDigit);
// }

console.log(wordToDigit('')); // ''

console.log(wordToDigit('Call.')); // "Call."

console.log(wordToDigit('Please call me.')); // "Please call me."

console.log(wordToDigit('Please call me at five five five one two three four. Thanks.'));
// "Please call me at 5 5 5 1 2 3 4. Thanks."

console.log(wordToDigit('Please onetwothree call me at five five five one two three four. Thanks.'));
// "Please onetwothree call me at 5 5 5 1 2 3 4. Thanks."

console.log(wordToDigit('Please call me at five, five five one two three four. Thanks.'));
// "Please call me at 5 5 5 1 2 3 4. Thanks."

console.log(wordToDigit('Please call me at Five, fiVe five one two three four. Thanks.'));
// "Please call me at 5 5 5 1 2 3 4. Thanks."

console.log(wordToDigit('Please call me at -five, -five- five one two three four. Thanks.'));
// "Please call me at 5 5 5 1 2 3 4. Thanks."

