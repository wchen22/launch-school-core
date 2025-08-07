// You are given a grid represented as a
// nested array filled with strings.

// Chaos is standing at the top-left corner of
// the grid and can move either down or right at
// any point in time. However, there are sleeping
// cats in certain squares, represented by the
// letter "C" in the grid, and Chaos cannot go through
// these squares.

// Determine the number of distinct paths Chaos
// can take to reach a bowl of treats placed at
// the bottom-right corner of the grid.

// Define a function `chaosInTheGridWithCats` that,
// given a nested array, returns the number of
// unique paths that Chaos can take to reach the
//  bottom-right corner.

// The grid will have at least 1 row and 1 column.

// Example:

// Given the following 2x3 grid:

const grid = [
  ["", "C", ""],
  ["", "", ""],
];

// There is only one distinct path Chaos can take:
// 1. Down -> Right -> Right
function chaosInTheGrid(grid) {

}
function chaosInTheGridWithCats(grid) {
  // implementation
    // bottom up approach
    let numRows = grid.length + 1;
    let numCols = grid[0].length + 1;
  
    let dp = new Array(numRows).fill(0).map(row => new Array(numCols).fill(0));
    //let dp = new Array(numRows).fill(new Array(numCols).fill(0));
  
    for (let rowNum = 1; rowNum < numRows; rowNum += 1) {
      for (let colNum = 1; colNum < numCols; colNum += 1) {
        if (grid[rowNum - 1][colNum - 1] === 'C') {
          dp[rowNum][colNum] = 0;
        } else if (rowNum === 1 && colNum === 1) {
          dp[rowNum][colNum] = 1;
        } else {
          dp[rowNum][colNum] = dp[rowNum - 1][colNum] + dp[rowNum][colNum - 1];
        }
      }
    }
  
    return (dp.slice(-1)[0].slice(-1)[0]);
}

// Test Cases:

const grid1 = [
  ["", "C"],
  ["", ""],
];
const grid2 = [["", "C"]];
const grid3 = [
  ["", "", ""],
  ["", "C", ""],
  ["", "", ""],
];
const grid4 = [
  ["", "", "", "", "C"],
  ["", "C", "", "", ""],
  ["", "", "", "C", ""],
];
const grid5 = [
  ["", "", "", "", "C", ""],
  ["", "C", "", "", "", ""],
  ["", "", "", "", "", ""],
  ["", "", "", "C", "", ""],
  ["", "C", "", "", "", ""],
  ["", "", "", "", "", ""],
];

console.log(chaosInTheGridWithCats(grid1) === 1);
console.log(chaosInTheGridWithCats(grid2) === 0);
console.log(chaosInTheGridWithCats(grid3) === 2);
console.log(chaosInTheGridWithCats(grid4) === 2);
console.log(chaosInTheGridWithCats(grid5) === 43);