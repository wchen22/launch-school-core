// Reverse It Part 1
// Write a function that takes a string argument and returns a new string containing the words from the string argument in reverse order.

// Examples:

function reverseSentence(string) {
  console.log(string.split(' ').reverse().join(' '));
}

reverseSentence('');                       // ""
reverseSentence('Hello World');            // "World Hello"
reverseSentence('Reverse these words');    // "words these Reverse"

// Reverse It Part 2
// Write a function that takes a string argument containing one or more words and returns a new string containing the words from the string argument. All five-or-more letter words should have their letters in reverse order. The string argument will consist of only letters and spaces. Words will be separated by a single space.

// Examples:

function reverseWords(string) {
  const words = string.split(' ');
  const reverse = word => [...word].reverse().join('');
  return words.map(word => word.length >= 5 ? reverse(word) : word).join(' ');
}

console.log(reverseWords('Professional'));             // "lanoisseforP"
console.log(reverseWords('Walk around the block'));    // "Walk dnuora the kcolb"
console.log(reverseWords('Launch School'));            // "hcnuaL loohcS"