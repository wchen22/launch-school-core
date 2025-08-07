// Write a function that takes a string as an argument and returns that string with a staggered capitalization scheme. Every other character, starting from the first, should be capitalized and should be followed by a lowercase or non-alphabetic character. Non-alphabetic characters should not be changed, but should be counted as characters for determining when to switch between upper and lower case.

let staggeredCase = function(string) {
  return [...string].map((char, index) => (index % 2 === 0) ? char.toUpperCase(): char.toLowerCase()).join('');
};


console.log(staggeredCase('I Love Launch School!'));        // "I LoVe lAuNcH ScHoOl!"
console.log(staggeredCase('ALL_CAPS'));                     // "AlL_CaPs"
console.log(staggeredCase('ignore 77 the 4444 numbers'));   // "IgNoRe 77 ThE 4444 nUmBeRs"

// Part 2

// Modify the function from the previous exercise so that it ignores non-alphabetic characters when determining whether a letter should be upper or lower case. Non-alphabetic characters should still be included in the output string, but should not be counted when determining the appropriate case.

staggeredCase = function(string) {
  let alphaCount = 0;
  return [...string].map(char => {
    if (/[a-z]/i.test(char)) {
      alphaCount += 1;
      if (alphaCount % 2 === 1) {
        return char.toUpperCase();
      } else return char.toLowerCase();
    } else return char;
  }).join('');
};

console.log(staggeredCase('I Love Launch School!'));        // "I lOvE lAuNcH sChOoL!"
console.log(staggeredCase('ALL CAPS'));                     // "AlL cApS"
console.log(staggeredCase('ignore 77 the 444 numbers'));    // "IgNoRe 77 ThE 444 nUmBeRs"

// Testing
const tests = [
  { input: 'I Love Launch School!', expected: 'I lOvE lAuNcH sChOoL!' },
  { input: 'ALL CAPS', expected: 'AlL cApS' },
  { input: 'ignore 77 the 444 numbers', expected: 'IgNoRe 77 ThE 444 nUmBeRs' },
  {
    input: 'ignore 777 the 444 numbers',
    expected: 'IgNoRe 777 ThE 444 nUmBeRs',
  },
  { input: '', expected: '' },
  { input: 'a', expected: 'A' },
  { input: '1', expected: '1' },
  { input: '1aB', expected: '1Ab' },
  { input: 'ab', expected: 'Ab' },
  { input: 'aB', expected: 'Ab' },
  { input: 'a1', expected: 'A1' },
  { input: 'a1B', expected: 'A1b' },
  { input: 'a11B', expected: 'A11b' },
  { input: 'a12B', expected: 'A12b' },
  { input: 'a111B', expected: 'A111b' },
  { input: 'A1B', expected: 'A1b' },
  { input: 'a!a', expected: 'A!a' },
  { input: 'ab!ab', expected: 'Ab!Ab' },
  { input: 'ab!!ab', expected: 'Ab!!Ab' },
  { input: 'ab!!!ab', expected: 'Ab!!!Ab' },
  { input: 'ab!a!!ab', expected: 'Ab!A!!aB' },
];

function runTests(tests, fn, verbose = false) {
  let allPassed = true;

  tests.forEach((test) => {
    let passed;
    let output;

    try {
      output = fn(test.input);
      passed = output === test.expected;
    } catch (e) {
      output = e;
    }

    if (!passed) allPassed = false;

    console.log(passed ? 'pass' : 'FAIL');
    if (!passed || verbose) {
      console.log(`Input: ${test.input}`);
      console.log(`Output:`);
      console.dir(output);
      console.log(`Expected:`);
      console.dir(test.expected);
    }
  });

  console.log(allPassed ? 'All tests passed' : 'One or more tests failed.');
}

runTests(tests, staggeredCase);