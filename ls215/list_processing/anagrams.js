// Write a Function named anagram that takes two arguments: a word and an array of words. Your function should return an array that contains all the words from the array argument that are anagrams of the word argument. For example, given the word "listen" and an array of candidate words like "enlist", "google", "inlets", and "banana", the program should return an array that contains "enlist" and "inlets".

// Examples
function anagram(word, list) {
  return list.filter(candidate => {
    let isAnagram = true;
    let alphaWord = [...word].sort();
    let alphaCandidate = [...candidate].sort();
    alphaWord.forEach((letter, index) => {
      if (alphaCandidate[index] !== letter) isAnagram = false;
    });
    return isAnagram;
  });
  // filter the array
    // criteria: same number and distribution of letters as word
    // both sorted have same values
}

console.log(anagram('listen', ['enlists', 'google', 'inlets', 'banana']));  // [ "inlets" ]
console.log(anagram('listen', ['enlist', 'google', 'inlets', 'banana']));   // [ "enlist", "inlets" ]

// In this example using the isAnagram because a return statement from within line 9's callback would not return false for the entire filter callback.

// To achieve this 'short circuit' behavior, using array.every to return a boolean would be a good choice. array.some as well depending on the problem. 