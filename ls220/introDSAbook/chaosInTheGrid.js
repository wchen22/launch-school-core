// You are given a grid represented as a nested array filled
// with empty strings. Chaos, the puppy, is standing at the
// top-left corner of the grid and can move either down or right
// at any point in time. Determine the number of distinct paths
// Chaos can take to reach a bowl of treats placed at the
// bottom-right corner of the grid.

// Define a function `chaosInTheGrid` that, given a nested
// array, returns the number of unique paths that Chaos
// can take to reach the bottom-right corner.

// The grid will have at least 1 row and 1 column.

// Example:

// Given the following 2x3 grid:

const grid = [
  ["", "", ""],
  ["", "", ""],
];

// There are three distinct path Chaos can take:
// 1. Right -> Right -> Down
// 2. Right -> Down -> Right
// 3. Down -> Right -> Right

// function chaosInTheGrid(grid) {
//   // bottom up approach
//   let numRows = grid.length + 1;
//   let numCols = grid[0].length + 1;

//   let dp = new Array(numRows).fill(0).map(row => new Array(numCols).fill(0));
//   //let dp = new Array(numRows).fill(new Array(numCols).fill(0));

//   for (let rowNum = 1; rowNum < numRows; rowNum += 1) {
//     for (let colNum = 1; colNum < numCols; colNum += 1) {
//       if (rowNum === 1 && colNum === 1) {
//         dp[rowNum][colNum] = 1;
//       } else {
//         dp[rowNum][colNum] = dp[rowNum - 1][colNum] + dp[rowNum][colNum - 1];
//       }
//     }
//   }

//   return (dp.slice(-1)[0].slice(-1)[0]);
// }

function chaosInTheGrid(grid) {
  let rows = grid.length;
  let cols = grid[0].length;
  let memo = new Array(rows).fill(0).map(row => new Array(cols).fill(null));

  function chaosInTheGridMemoized(rows, cols) {
    if (memo[rows - 1][cols - 1] !== null) return memo[rows - 1][cols - 1];
  
    let result;
  
    if (rows === 1 || cols === 1) {
      result = 1;
    } else {
      result = chaosInTheGridMemoized(rows - 1, cols) +
               chaosInTheGridMemoized(rows, cols - 1);
    }
  
    memo[rows-1][cols-1] = result;
    return result;
  }

  return chaosInTheGridMemoized(rows, cols);
}



// Test cases

const grid1 = [[""]];
const grid2 = [
  ["", ""],
  ["", ""],
];
const grid3 = [
  ["", "", ""],
  ["", "", ""],
  ["", "", ""],
];
const grid4 = [
  ["", "", "", "", ""],
  ["", "", "", "", ""],
  ["", "", "", "", ""],
];
const grid5 = [
  ["", "", "", "", "", ""],
  ["", "", "", "", "", ""],
  ["", "", "", "", "", ""],
  ["", "", "", "", "", ""],
  ["", "", "", "", "", ""],
  ["", "", "", "", "", ""],
];
console.log(chaosInTheGrid(grid1) === 1);
console.log(chaosInTheGrid(grid2) === 2);
console.log(chaosInTheGrid(grid3) === 6);
console.log(chaosInTheGrid(grid4) === 15);
console.log(chaosInTheGrid(grid5) === 252);
// All test cases should log true