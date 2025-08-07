// Write a function that takes a string as an argument, and returns the string stripped of spaces from both ends. Do not remove or alter internal spaces.

// Example
trim('  abc  ');  // "abc"
trim('abc   ');   // "abc"
trim(' ab c');    // "ab c"
trim(' a b  c');  // "a b  c"
trim('      ');   // ""
trim('');         // ""
// You may use the square brackets ([]) to access a character by index (as shown below), and the length property to find the string length. However, you may not use any other properties or methods from JavaScript's built-in String class.

function trim(string) {
  let copyMode = false;
  let leftStrippedString = "";
  for (let charIndex = 0; charIndex < string.length; charIndex += 1){
    let currentChar = string[charIndex]
    if(currentChar !== " ") {
      copyMode = true;
    }
    if (copyMode) {
      leftStrippedString += currentChar;
    }
  }

  copyMode = false;
  let strippedString = "";
  for (let charIndex = leftStrippedString.length - 1; charIndex >= 0; charIndex -= 1){
    let currentChar = leftStrippedString[charIndex]
    if(currentChar !== " ") {
      copyMode = true;
    }
    if (copyMode) {
      strippedString = currentChar + strippedString;
    }
  }
  console.log(strippedString);
}

// set copyMode to false
// iterate through the string chars
  // if the current char is not a space, set copyMode to true
  // if copyMode
      // add the charto a new string
// iterate backwards from the index at length of the string - 1 down to 0 index
    //if the first char is a space, until it hits an actual char, skip it
      // when it hits a char, add the rest of the word to a new string
// 'hello'[0];       // "h"
// 'hello'[4];       // "o"