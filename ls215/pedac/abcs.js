// Problem Description
// A collection of spelling blocks has two letters per block, as shown in this list:

// B:O   X:K   D:Q   C:P   N:A
// G:T   R:E   F:S   J:W   H:U
// V:I   L:Y   Z:M
// This limits the words you can spell with the blocks to only those words that do not use both letters from any given block. You can also only use each block once.

// Write a function that takes a word string as an argument, and returns true if the word can be spelled using the set of blocks, or false otherwise. You can consider the letters to be case-insensitive when you apply the rules.

/**
 * Problem: Given a set of thirteen spelling blocks, each containing 2 letters of the alphabet, write a function that returns whether or not a given word can be spelled using those blocks. A block can only be used once.
 * 
 * Input: String to test
 * Output: true/false - whether the word can be spelled with the blocks
 * Rules
 * - Case does not matter (i.e. treat lower case letters the same)
 * - Blocks can only be used once
 * Questions
 * - Can I always expect a string input? // Yes
 * - Can I assume we always get one argument, or should I handle smaller/greater arity?
 * - If not, what other input types might I expect, and how should I treat them?
 * - How should I handle an empty string? true or false or something else? // return undefined
 * - Should I expect non-alphabetical characters? If so, how should I treat them? Should I assume that a word is not spellable, or should I just ignore them and only consider the valid characters?
 * 
 * Data Structures:
 * - Input is a string whose characters we want to test -> array of chars to iterate over
 * - 13 blocks, each with two letters [['B', 'O'], ['X', 'K'] ...]
 * - Assuming we have a valid string input each time
 * 
 * Algorithm:
 * - Split the string into characters, and map to their capitalized version
 * - Iterate over the characters array
 * - For each character, 
 *    - useBlock(letter, blocks): check the blocks array for a block with the letter, remove it, and return it. If not found return false
 *    if !useBlock(letter, blocks) return false
 * 
 * - Return true  
 */

// let blocks = 'B:O X:K D:Q C:P N:A G:T R:E F:S J:W H:U V:I L:Y Z:M'
// blocks = blocks.split(' ');
// blocks = blocks.map(block => block.split(':'));

const SPELLING_BLOCKS = [
  [ 'B', 'O' ], [ 'X', 'K' ],
  [ 'D', 'Q' ], [ 'C', 'P' ],
  [ 'N', 'A' ], [ 'G', 'T' ],
  [ 'R', 'E' ], [ 'F', 'S' ],
  [ 'J', 'W' ], [ 'H', 'U' ],
  [ 'V', 'I' ], [ 'L', 'Y' ],
  [ 'Z', 'M' ]
];

// function createSet(blocks) {
//   blocks = blocks.map(block => [...block]);

//   return {
//     useBlock: function(letter) {
//       for (let index = 0; index < blocks.length; index += 1) {
//         if (blocks[index].includes(letter)) {
//           return blocks.splice(index, 1)[0];
//         }
//       }
//       return null;
//     }
//   };
// }

// function isBlockWord(word) {
//   if (word === '') return undefined;
//   const letters = word.split('').map(char => char.toUpperCase());

//   let blocks = createSet(SPELLING_BLOCKS);

//   return letters.every(letter => blocks.useBlock(letter));
// }


// Different algorithm approach:
/**
 * Create an array of used letters
 * Iterate over the string characters
 * For each character
 *  If it is in the used letters array, return false
 *  Else, find the block and move its two letters into used letters array
 * Return true
 * 
 * Doing this by following the third video in the watch and code series:
 *  - Problem: algorithm did not capture edge cases of handling when the block isn't found. Affirms that I went with perhaps a bit more of a complicated approach of creating an encapsulated blocks array and then retrieving a block from it, which allows me to intuitively short circuit if the block isn't found. That approach works well to return false if the 'desired block' is either one that doesn't exist or has already been used.
 */
function isBlockWord(word) {
  const getBlock = letter => SPELLING_BLOCKS.filter(block => block.includes(letter))[0];

  if (word === '') return undefined;

  let usedLetters = [];

  return [...word].every(letter => {
    letter = letter.toUpperCase();
    if (usedLetters.includes(letter)) {
      return false;
    } else {
      let block = getBlock(letter);
      if (!block) return false;
      usedLetters.push(...block);
    }
    return true;
});
}
// Examples:

console.log(isBlockWord('BATCH'));      // true
console.log(isBlockWord('BUTCH'));      // false
console.log(isBlockWord('jest'));       // true

console.log(isBlockWord('')); // undefined
console.log(isBlockWord(' ')); // false

console.log(isBlockWord('jes4t'));       // false



