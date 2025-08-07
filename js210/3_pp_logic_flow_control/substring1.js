// Write a function that returns a substring of a string based on a starting index and length.

// Examples
function substr(string, start, length) {
  if (length <= 0) {
    console.log("");
    return;
  }

  let substring = "";

  let startIndex;
  if (start < 0) {
    startIndex = string.length + start;
  } else {
    startIndex = start;
  }

  let endIndex = (string.length - 1 < startIndex + length - 1) ? string.length - 1 : startIndex + length - 1;

  for (let index = startIndex; index <= endIndex; index += 1) {
    substring += string[index];
  }

  console.log(substring);
}

let string = 'hello world';


/**
Input: a string, starting index, length of string
Output: a substring of the string based on starting index and length of string

Edge cases: Don't need to worry about invalid numbers/types.
- Negative starting index: treat it as strLength - 3
- More chars required than is available: use available characters
- Negative or 0 chars required: blank string

Algorithm
- Clause to return blank string if length <= 0
- Set the starting index
  - if negative, str.length + start
  - otherwise start
-Initialize returnString
- Iterate from starting index to length
  - concat to return string
-return returnString

// LS solution more concise:
// Instead of unnecessary complication of calculating start and end indices for different edge cases, uses the length as a counter (and simply breaks when the loop goes out of bounds when referencing a character) to add to the newString. Then just a matter of calculating the starting index. This method also accounts for lengths <= 0 by simply not triggering the for loop
 */
substr(string, 2, 4);      // "llo "
substr(string, -3, 2);     // "rl"
substr(string, 8, 20);     // "rld"
substr(string, 0, -20);    // ""
substr(string, 0, 0);      // ""

// The start argument is the starting index. If negative, treat it as strLength + start where strLength is the length of the string. For example, if start is -3, treat it as strLength - 3.
// The length argument is the maximum length of the desired substring. If length exceeds the number of characters available, just use the available characters.
