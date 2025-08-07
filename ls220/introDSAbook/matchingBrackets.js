// Practice: Matching Brackets
// In this assignment, you will apply what we've learned so far in this lesson to solve the "Matching Brackets" problem. First, identify which data structure could help you solve this problem. Feel free to use an array either as a stack or a queue, depending on what you find most suitable.

// Make sure to apply the PEDAC process. In this challenge, it's important to understand the problem well and break down the logical rules of matching brackets to be able to apply these rules to a solution.

// Problem Description
// Write a function `areMatched` that takes a string as an argument
// and returns true if all types of brackets (parentheses (),
// square brackets [], and curly braces {}) in the string are
// properly matched. For the brackets to be considered
// matched, every opening bracket must have a corresponding
// closing bracket of the same type, and the brackets must be
// correctly nested.

function areMatched(string) {
  // stack makes sense here: when a char is added to stack it must either be an open brace, or the matching closing brace of the topmost value
    // if it is a closing brace not matching the top stack value, then the top stack value brace isn't properly nested
  const brackets = [];
  const OPENS = ['(', '[', '{'];
  const CLOSES = [')', ']', '}'];

  for (let char of string) {
    if (OPENS.includes(char)) brackets.push(char);
    if (CLOSES.includes(char)) {
      let lastBracket = brackets.pop();
      if (OPENS.indexOf(lastBracket) !== CLOSES.indexOf(char)) return false;
    }
  }

  return brackets.length === 0;
}

console.log(areMatched("()"));              // Output: true
console.log(areMatched("([()]{})"));        // Output: true
console.log(areMatched("([((}]({}))"));     // Output: false
console.log(areMatched("{{[[(())]]}}"));    // Output: true
console.log(areMatched(""));                // Output: true
console.log(areMatched("([)]"));            // Output: false