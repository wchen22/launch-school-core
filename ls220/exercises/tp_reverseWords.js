// Reverse Words
// You are given a sentence represented by a string str. Your objective is to reverse all the characters in each word of the sentence while ensuring that the case of each character remains unchanged. The spaces between words should be preserved as they are, and the overall order of the words in the sentence must not be altered.

// You should solve the problem without using the Array.prototype.reverse method.

function reverseWords(string) {
  let words = string.split(' ');
  let reversedWords = words.map(word => {
    let left = 0;
    let right = word.length - 1;
    let chars = word.split('');

    while (left < right) {
      [chars[left], chars[right]] = [chars[right], chars[left]];
      left += 1;
      right -= 1;
    }

    return chars.join('');
  });

  return reversedWords.join(' ');
}

console.log(reverseWords("Hello World"))
// Example test cases:

console.log(reverseWords("Hello World") === "olleH dlroW");
console.log(reverseWords("JavaScript is fun") === "tpircSavaJ si nuf");
console.log(reverseWords("Coding in the sun") === "gnidoC ni eht nus");
console.log(reverseWords("Launch School") === "hcnuaL loohcS");