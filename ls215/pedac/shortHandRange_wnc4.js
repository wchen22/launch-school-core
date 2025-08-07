// You are given a list of numbers in a "short-hand" range where only the significant part of the next number is written because we know the numbers are always increasing (ex. "1, 3, 7, 2, 4, 1" represents [1, 3, 7, 12, 14, 21]). Some people use different separators for their ranges (ex. "1-3, 1-2", "1:3, 1:2", "1..3, 1..2" represent the same numbers [1, 2, 3, 11, 12]). Range limits are always inclusive.

// Your job is to return a list of complete numbers.

// The possible separators are: ["-", ":", ".."]

// "1, 3, 7, 2, 4, 1" --> 1, 3, 7, 12, 14, 21 // each number of the sequence represents the next highest possible integer with that number as its ones digit
// "1-3, 1-2" --> 1, 2, 3, 11, 12 // when we get a range, treat it as if all the numbers in that range are comma separated, e.g. "1-3, 1-2" = "1, 2, 3, 1, 2"
// "1:5:2" --> 1, 2, 3, 4, 5, 6, ... 12 // same as 1-5, 6-12
// EDGE case: "1-5, 5-12" // 1, 2, 3, 4, 5, 15, 16 ... 112
// "104-2" --> 104, 105, ... 112 // the next highest number ending with '2' is 112, so becomes 104, 105, ... 112
// "104-02" --> 104, 105, ... 202 // the next highest number ending with "02" is "202"
// "545, 64:11" --> 545, 564, 565, .. 611 // 545, next highest number is 564, then 611

/**
 * PROBLEM: Given a short-hand notation range, return the numbers represented by that short-hand.
 *  Input: A string representing the short-hand notation
 *    Can we always expect a string, and one argument? // Yes and yes
 *      How should I handle special inputs:
 *        - blank string ''
 *        - negative numbers? e.g. "1, -2, 3"
 *        - string without 
 *        - decimals? 
 *        - Answer: will only have separators and numbers
 *          - Will I ever have improperly formatted, e.g. string like "..104, 105"? No, can expect it to start and end with a number string with at least one separator/comma
 *  Output: An array of NUMBERS represented by the range
 * Rules:
 *  A number in the range represents the 'significant part' of the next number
 *    Significant seems to mean the portion of the next candidate number must end in and still be higher than last used number
 *  Commas separate individual values
 *  Possible range separators ["-", ":", ".."] to enclose multiple numbers within that range
 *  Zeroes are valid
 *  After the initial number in the array, any subsequent number string represents the ending digits of the next increasing integer
 *    If ranges are 'chained', any chained ranges should be treated as starting with the number 1 more than end of last range
 * 
 * 
 */

function parseInput(string) {
  string = string.replace(/:|\.\./g, '-');
  string = string.replace(/ /g, '');

  let numbers = string.split(/[,-]/);
  let symbols = string.replace(/[0-9 ]/g, '').split('');
  let replacedNumbers = increasingNumbers(numbers);
  // console.log(symbols);
  // console.log(replacedNumbers);
  return replacedNumbers.map((number, index) => {
    return String(number) + (symbols[index] || '');
  }).join('');
//   - replace all range symbols with '-'
// - Extract all number strings into an array
//   - expandIncreasingNumbers(array)
// - Extract all symbols into an array
// - Reconstruct original string by alternating expanded numbers, symbols
//  console.log( numbers);
}

function increasingNumbers(significantDigitStrings) {
  significantDigitStrings.forEach((digitString, index, array) => {
    if (index === 0) {
      array[index] = Number(digitString);
    } else array[index] = nextGreatest(array[index - 1], digitString);
  });

  return significantDigitStrings;
//   - Given an array of numberstrings
// - Map that array
//   - If no previous element, Number(numberString)
//   - If previous element, update to:
//     - nextGreatest(previous element, endingString)
}

function nextGreatest(number, digitString) { // 2111, '4' should return 2114
  // '2111' '4' length of one 
  // convert number to string
  // if digitString value is greater than number outright, just return Number(digitstring)
  // slice the last digitString.length numbers from number
  //   if digitString value is greater than the sliced portion
  //     append it to the original base ||0 +1
  //   if it's less than or equal
  //     append it to original base plus one
  // return Number(replaced)

  // 2111, 211/1 4
  // 545 64 -> 5, 45 vs 64
  // 564 11 -> 5, 64 vs 11 -> 611
  // 564 64 -> 5, 64 vs 64, 664
  // 30, 555 -> 555
  // 30 30 -> 0, 30 30 -> 130
  // 30 02 -> 0, 30 02 102
  // 30 2 -> 3, 0 v 2 -> 32

  if ((Number(digitString)) > number) return Number(digitString);

  let numberString = String(number);

  let partitionIndex = numberString.length - digitString.length;

  let ending = numberString.slice(partitionIndex);
  let beginning = numberString.slice(0, partitionIndex) || 0;

  if (Number(digitString) > Number(ending)) return Number(beginning + digitString);

  return Number((Number(beginning) + 1) + digitString);


};

// console.log(increasingNumbers([
//   '545', '64',
//   '11',  '333',
//   '111', '4',
//   '5'
// ]));

// parseInput("545, 64:11, 333..111, 4-5");
function expandRange(string) {
  //console.log(string);
  let output = [];
  let minMax = string.split('-');
  let first = Number(minMax[0]);
  let last = Number(minMax.slice(-1));
  //console.log([first, last]);

  for (let num = first; num <= last; num +=1) {
    output.push(num);
  }
  return output;
};

// console.log(expandRange('4'));

function numbersFrom(shorthand) {
  let parsedString = parseInput(shorthand);
  let rangeStrings = parsedString.split(',');
  let expandedRanges = rangeStrings.map(range => {
    //console.log(range);
    return expandRange(range);
  });
  return expandedRanges.flat();
}


/**
 * Data Structure and algorithm
 * - Start with input string
 * - parsedString = parseInput(string) // '5,10-22,33-100'
 *  
*  - rangeStrings = Split parsed input by comma ->  array of strings ['5', '10-22', '10-20-30']
   - map over rangeStrings
    - for each rangeString, split by '-'
    - expandNumbers(that array)
    - return minMax(expanded numbers)
  - arrayOfMinMax, map to fully expanded array of individual numbers
  - return flattened



    - Convert those strings to [min, max]
*       - Each string can be either
          - Single number
          - Simple range
          - Multiple range '1-5-12
        - So split by - to get an array with 1+ arguments. Calculate and return minMax(array)
    - Convert [min, max] to expanded array
    - Flatten and return


HELPERS:
parseInput(takes original string argument)
- replace all range symbols with '-'
- Extract all number strings into an array
  - expandIncreasingNumbers(array)
- Extract all symbols into an array
- Reconstruct original string by alternating expanded numbers, symbols

expandIncreasingNumbers(array)
- Given an array of numberstrings
- Map that array
  - If no previous element, Number(numberString)
  - If previous element, update to:
    - nextGreatest(previous element, endingString)

nextGreatest(previousNumber, endingString)
- iterate over [1, 2, ...9], concatenate it with '02', return if it is greater than previous
 */

console.log(numbersFrom("3")); // [3]
console.log(numbersFrom("1, 3, 7, 2, 4, 1")); // [1, 3, 7, 12, 14, 21]
console.log(numbersFrom("1-3, 1-2")); // [1, 2, 3, 11, 12]

// chained range
console.log(numbersFrom("1:5:2")); // same as 1-5, 6-12 [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
console.log(numbersFrom("0:0:0")); // 0-10, 11-20 [0, 1, 2, 3, ..., 20]
console.log(numbersFrom('3-2-2')); // 3-12, 13-22 

// numbers beginning with '0' 
console.log(numbersFrom("104-02")); // [104, 105, ... 202]
console.log(numbersFrom("63-05")); // 63-105 => [63, 64, ... 105]

console.log(numbersFrom("545, 64:11")) // [545, 564, 565, .. 611]

console.log(numbersFrom("12-3, 545, 64:11")) // [12, 13, 545, 564, 565, 565, ... 611]

