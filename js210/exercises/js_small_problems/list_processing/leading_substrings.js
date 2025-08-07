// Write a function that takes a string argument and returns a list of substrings of that string. Each substring should begin with the first letter of the word, and the list should be ordered from shortest to longest.

function leadingSubstrings(string) {
  // return [...string].map((_, index) => string.slice(0, index +1));
  let substring = '';
  let output = [];
  for (let index = 0; index < string.length; index +=1) {
    substring += string[index];
    output.push(substring);
  }

  return output;
}

console.log(leadingSubstrings('abc'));      // ["a", "ab", "abc"]
console.log(leadingSubstrings('a'));        // ["a"]
console.log(leadingSubstrings('xyzzy'));    // ["x", "xy", "xyz", "xyzz", "xyzzy"]

// All Substrings
// Write a function that returns a list of all substrings of a string. Order the returned list by where in the string the substring begins. This means that all substrings that start at index position 0 should come first, then all substrings that start at index position 1, and so on. Since multiple substrings will occur at each position, return the substrings at a given index from shortest to longest.

// You may (and should) use the leadingSubstrings function you wrote in the previous exercise:

function substrings(string) {
  // let output = [];
  // [...string].forEach((char, index) => {
  //   output.push(leadingSubstrings(string.slice(index)));
  // });

  // return output.flat();
  return [...string].map((char, index) => {
    return leadingSubstrings(string.slice(index));
  }).flat();
}

console.log(substrings('abcde'));

// returns
// [ "a", "ab", "abc", "abcd", "abcde",
//   "b", "bc", "bcd", "bcde",
//   "c", "cd", "cde",
//   "d", "de",
//   "e" ]

// Further Exploration
// Rewrite substrings using list processing functions. That is, convert the string into an array of some sort and use functions like map, filter, or reduce to get the desired substrings. (You will also need to use join.) Try not to use forEach as that is too similar to the for loop approach.


// Palindromic Substrings
// Write a function that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as backwards. The substrings in the returned list should be sorted by their order of appearance in the input string. Duplicate substrings should be included multiple times.

// You may (and should) use the substrings function you wrote in the previous exercise.

// For the purpose of this exercise, you should consider all characters and pay attention to case; that is, 'AbcbA' is a palindrome, but 'Abcba' and 'Abc-bA' are not. In addition, assume that single characters are not palindromes.

// Examples:

function palindromes(string) {
  return substrings(string).filter(isPalindrome);
}

function isPalindrome(string) {
  return [...string].reverse().join('') === string && string.length > 1;
}


palindromes('abcd');       // []
palindromes('madam');      // [ "madam", "ada" ]

console.log(palindromes('hello-madam-did-madam-goodbye'));
// returns
// [ "ll", "-madam-", "-madam-did-madam-", "madam", "madam-did-madam", "ada",
//   "adam-did-mada", "dam-did-mad", "am-did-ma", "m-did-m", "-did-", "did",
//   "-madam-", "madam", "ada", "oo" ]

console.log(palindromes('knitting cassettes'));
// returns
// [ "nittin", "itti", "tt", "ss", "settes", "ette", "tt" ]