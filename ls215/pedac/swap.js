// Problem Description
// Write a function called swap that takes a string as an argument, and returns a new string, where the alphabetic characters have taken the place of the numeric characters, and vice versa.

/**
PROBLEM: Given a string, return a new string where alphabetic characters and numeric characters are swapped
  INPUT
- String
Q: Will we always receive a string as input?
Q: Will the string always have both numeric and alphabetic chars? If not should we return a copy of the string?
  A: Yes
Q: If there are other characters, should I leave them in place?
  A: Yes
Q: How should we handle an empty string argument?
  A: Return empty string
Q: Can it contain upper case letters? If so, do the same rules apply for swapping?
  A: Yes

  OUTPUT
- String with chars swapped

  RULES
Q: Is there only one valid output for each input?
Q: If there are more alphabetic vs numeric chars or vice-versa, do we just swap the shared # in order from left to right?
  -> In other words, any letters or numeric chars are swapped for one of the other type if available, if there are no more available then leave it as is

DATA STRUCTURE AND ALGORITHM
# STRING input (can contain alphanumeric chars, other chars, can be empty)
- Return "" if input is ""
- Initialize a numberOfSwaps variable to the smaller of the count of alphabetic characters (a-zA-Z), or numeric characters
# ARRAY: Match the string for alphabetic characters, slice it from index 0 to numberOfSwaps
# ARRAY: Match the string for numeric characters, slice it from index 0 to numberOfSwaps
# ARRAY Get an array of characters from the string input
# ARRAY map of characters array, character =>
  - If character is alphabetic
    - Get a character to swap by shifting first element at numberSwaps array
    > If that character is not undefined, return it, otherwise return original character
  - If character is numeric
    - Get a character to swap by shifting first element at alphaSwaps array
    > If that character is not undefined, return it, otherwise return original character
  > Otherwise return the character
> Return the mapped array joined into a string

*/

const isAlpha = char => /[a-z]/i.test(char);
const isNumber = char => /[0-9]/.test(char);

function swap(str) {
  if (str === "") return "";
  const chars = [...str]
  const alphaChars = chars.filter(isAlpha);
  const numericChars = chars.filter(isNumber);

  let swappedChars = chars.map(char => {
    if (isAlpha(char)) return numericChars.shift() || char;
    if (isNumber(char)) return alphaChars.shift() || char;
    return char;
  });

  return swappedChars.join('');
}


console.log(swap("") === ""); // true
console.log(swap("1a2b3c") === "a1b2c3"); // true
console.log(swap("1a2b3c45d__") === "a1b2c3d54__"); // true
console.log(swap("abcd") === "abcd"); // true
console.log(swap("1") === "1"); // true
console.log(swap("abcd123") === "123dabc"); // true
console.log(swap("1a2b3c456") === "a1b2c3456"); // true
console.log(swap("ab5cd123") === "51a23bcd"); // true
console.log(swap("ab5cd123") === "51a23bcd"); // true
console.log(swap("1a2_b3 c4@56") === "a1b_2c 34@56"); // true
console.log(swap("ab1CD23") === "12a3DbC"); // true





