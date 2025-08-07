// Write a function that returns a string converted to lowercase.

// To convert a single uppercase character to a lowercase character, get its ASCII numeric representation from the ASCII table, add 32 to that number, then convert the number back to a character using the same ASCII table. You can use the String.fromCharCode and the String.charCodeAt methods for these operations. For example:

let string = 'A';
let asciiNumeric = string.charCodeAt(0);         // 65
asciiNumeric += 32;
string = String.fromCharCode(asciiNumeric);  // "a", converted to lowercase

// Examples

function toLowerCase(string) {
  const isUpperCase = letter => letter.charCodeAt(0) >= 65 && letter.charCodeAt(0) <= 90; 

  let lowerCaseString = ""
  for (let index = 0; index < string.length; index += 1) {
    let currentChar = string[index];
    if (isUpperCase(currentChar)) {
      let lowerCaseAsciiNumeric = currentChar.charCodeAt(0) + 32;
      lowerCaseString += String.fromCharCode(lowerCaseAsciiNumeric);
    } else {
      lowerCaseString += currentChar;
    }
  } 
  console.log(lowerCaseString);
}

toLowerCase('ALPHABET');    // "alphabet"
toLowerCase('123');         // "123"
toLowerCase('abcDEF');      // "abcdef"