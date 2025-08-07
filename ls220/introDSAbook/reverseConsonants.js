// Practice: Reverse Consonants
// In this assignment, we'll again apply the techniques learned so far by solving the "Reverse Consonants" problem. Try to solve the problem using the naive (brute-force) approach first, and then see if you can optimize the solution.

// Problem Description

// Given a string `str`, reverse all the consonants in the string and return it.
// Consonants are all alphabetic characters except for the vowels `'a'`, `'e'`, `'i'`,
// `'o'`, and `'u'`, which can appear in both lower and upper cases.
// The consonants can appear more than once in the string.

/*
Brute force approach:
iterate over the string, if it current letter is a consonant store it in consonants array

initialize output string ''
iterate over the string again, 
  if it's not a consonant, append it to output
  if it's a consonant, pop the last letter from consonants array and append to output
return output

This would be O(n), 2 linear passes

How would I do it with a start-end pointer strategy?

get array of chars
start end pointers
if start is not a consonant, increase it
if end is not a consonant, decrease it
when both are consonants, swap them


return joined array
*/

function reverseConsonants(string) {
  const chars = [...string];
  let start = 0;
  let end = chars.length - 1;

  while (start < end) {
    if (/[aeiou]/i.test(chars[start])) {
      start += 1;
    } else if (/[aeiou]/i.test(chars[end])) {
      end -= 1;
    } else {
      [chars[start], chars[end]] = [chars[end], chars[start]]
      start += 1;
      end -= 1;
    };
  }

  return chars.join('');
}

console.log(reverseConsonants("") === "");
console.log(reverseConsonants("s") === "s");
console.log(reverseConsonants("HELLO") === "LELHO");
console.log(reverseConsonants("leetcode") === "deectole");
console.log(reverseConsonants("example") === "elapmxe");
console.log(reverseConsonants("Consonants") === "sotnonasnC");

// All test cases should log true