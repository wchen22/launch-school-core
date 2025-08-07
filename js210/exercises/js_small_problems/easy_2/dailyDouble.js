// Ddaaiillyy ddoouubbllee
// Write a function that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character.

// Examples:

function crunch(string) {
  let output = '';
  [...string].forEach((char) => {
    if (output.slice(-1) !== char) {
      output += char;
    }
  });

  console.log(output);
}

crunch('ddaaiillyy ddoouubbllee');    // "daily double"
crunch('4444abcabccba');              // "4abcabcba"
crunch('ggggggggggggggg');            // "g"
crunch('a');                          // "a"
crunch('');                           // ""