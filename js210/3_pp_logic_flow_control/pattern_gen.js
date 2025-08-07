// Write a function that takes a number of rows as the argument nStars and logs a square of numbers and asterisks. For example, if nStars is 7, log the following pattern:

function generatePattern(nRows) {
  let numString = '';
  let starString = '*'.repeat(nRows);
  for (let currentRow = 1; currentRow <= nRows; currentRow += 1) {
    numString += currentRow;
    starString = starString.slice(0, -1)
    console.log(numString + starString);
  }
}

generatePattern(7);

// console output
// 1******
// 12*****
// 123****
// 1234***
// 12345**
// 123456*
// 1234567
// You may assume that nStars is greater than 1 and less than 10.

// Have you tried supplying generatePattern with a number greater than 9? What did you observe? Can you fix the current implementation so that it still renders as a rectangle? Try it yourself before scrolling down.

function generatePattern(nStars) {
  let lastRowString = '';
  
  for (let lineNumber = 1; lineNumber <= nStars; lineNumber += 1) {
    lastRowString += String(lineNumber);
  }

  let rowLength = lastRowString.length;

  for (let lineNumber = 1; lineNumber <= nStars; lineNumber += 1) {
    let rowString = '';
    for (let digit = 1; digit <= lineNumber; digit += 1) {
      rowString += String(digit);
    }
    let numberStars = rowLength - rowString.length;
    console.log(rowString + '*'.repeat(numberStars));
  }
}

 generatePattern(20);

// console output
// 1******************************
// 12*****************************
// 123****************************
// 1234***************************
// 12345**************************
// 123456*************************
// 1234567************************
// 12345678***********************
// 123456789**********************
// 12345678910********************
// 1234567891011******************
// 123456789101112****************
// 12345678910111213**************
// 1234567891011121314************
// 123456789101112131415**********
// 12345678910111213141516********
// 1234567891011121314151617******
// 123456789101112131415161718****
// 12345678910111213141516171819**
// 1234567891011121314151617181920