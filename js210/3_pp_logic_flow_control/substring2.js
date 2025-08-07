// This practice problem is similar to the previous one. This time though, both arguments are indices of the provided string. The following rules apply:

// If both start and end are positive integers, start is less than end, and both are within the boundary of the string, return the substring from the start index (inclusive), to the end index (NOT inclusive).
// If the value of start is greater than end, swap the values of the two, then return the substring as described above.
// If start is equal to end, return an empty string.
// => take the smaller arg as starting index, difference of args as counter. Iterate and break if character index goes out of bounds

// (4, 2) => 2, 4
// (2) => 2, string.length - 2
// ('a') => 0, string.length - 0
// (-10, 5) => 0, 5
// If end is omitted, the end variable inside the function isundefined. Return the substring starting at position start up through (and including) the end of the string.
// If either start or end is less than 0 or NaN, treat it as 0.
// If either start or end is greater than the length of the string, treat it as equal to the string length.

function substring(string, start, end) {
  let output = "";

  if (!(start >= 0)){
    start = 0;
  }
  if (end === undefined) {
    end = string.length;
  }
  else if (!(end >= 0)) {
    end = 0;
  }

  let temp;
  if (start > end) {
    temp = start;
    start = end;
    end = temp;
  }

  for (let index = start; index < end; index += 1) {
    if (string[index] === undefined) {
      break;
    }
    output += string[index];
  }

  console.log(output);
}

let string = 'hello world';

substring(string, 2, 4);    // "ll"
substring(string, 4, 2);    // "ll"
substring(string, 0, -1);   // ""
substring(string, 2);       // "llo world"
substring(string, 'a');     // "hello world"
substring(string, 8, 20);   // "rld"

