// Problem Description
// In the game of chess, a queen can attack pieces which are on the same row, column, or diagonal. Positions on the board equate to coordinate numbers. Given a set up like so:

// _ _ _ _ _ _ _ _
// _ _ _ _ _ _ _ _
// _ _ _ W _ _ _ _
// _ _ _ _ _ _ _ _
// _ _ _ _ _ _ _ _
// _ _ _ _ _ _ B _
// _ _ _ _ _ _ _ _
// _ _ _ _ _ _ _ _

// The white queen's position equates to (2, 3) and the black queen is at (5, 6). In this example the queens are on the same diagonal, and therefore can attack each other.

// Write a function which, given a string representation of the board with the two queens, returns true or false depending on whether the queens can attack each other or not.

/**
 Problem
  Input: A string representation of the board with two queens
    - Can we expect always 1 'W' and 1 'B' to represent the two queens, and the rest of the board as _ character?
    - Assumption: 8 x 8 board
    - Is the string delimited?
  
  Intermediate:
    - Parse the string input and get the position of the 'W' and 'B' queens
    - Positions represented by (row, column) where top left of the board is 0, 0 and bottom right of the board is 7, 7
  
  Output: True or false
    - Representing whether the queens can attack each other or not
      - canAttackEachOther assumptions
        - same row, column, or diagonal
        - row: first coordinate is the same
        - column: second coordinate is the same
        - diagonal: absolute value of the difference between the two respective coordinates is equal
          - (2, 3) -> (5, 6) = 3, 3
          - (7, 0) -> (5, 2) = 2, -2
  Rules:
  - Board is 8x8 (0-7, 0-7)
  - Only queen pieces on the board
  - Queens are 'B' and 'W' for black and white queen
  - Queens may be missing
    - return undefined if one or both queens are missing
  - We will always be given a board
    - underscores, new lines, W, and B

 Data Structures
 0) Return undefined if W and B are not both present
 1) String in format of "________\n_____W__\n____B___\n..."
 2) Nested array of strings excluding and split by '\n'
    - Indices of outer array are rows
    - Indices of inner strings are columns
 3) Find the coordinates of 'W' and 'B' and store in array e.g. [2, 3]
    - Iterate over the array's strings with index
      - If the indexof the 'W' or 'B' isn't -1
      - Set the W/B coordinates to current array index, String.indexOf(W/B)
 4) Calculate whether they are in same row, column, or diagonal and return true or false
    - First elements the same?
    - Second elements the same?
    - Diagonals: Calculate differences of rows and columns, are the absolute values of those differences the same?
 **/

function queenCoordinates(board) {
  let coordinates = {};

  board.forEach((row, rowNum) => {
    const whiteColNum = row.indexOf('W');
    const blackColNum = row.indexOf('B');
    if (whiteColNum !== -1) coordinates['W'] = [rowNum, whiteColNum];
    if (blackColNum !== -1) coordinates['B'] = [rowNum, blackColNum];
  });

  return coordinates;
}

function canAttack(piece1, piece2) {
  const sameRow = (piece1[0] === piece2[0]);
  const sameCol = (piece1[1] === piece2[1]);
  const onDiagonal = (Math.abs(piece1[0] - piece2[0]) ===
                      Math.abs(piece1[1] - piece2[1]));
  return sameRow || sameCol || onDiagonal;
}

function queenAttack(boardString) {
  const board = boardString.split('\n');

  let coordinates = queenCoordinates(board);

  if (!coordinates['W'] || !coordinates['B']) return undefined;
  return canAttack(coordinates['W'], coordinates['B']);
}

// Diagonal attack
console.log(queenAttack("________\n"+
                        "________\n"+
                        "___W____\n"+
                        "________\n"+
                        "________\n"+
                        "______B_\n"+
                        "________\n"+
                        "________\n") === true);
            
console.log(queenAttack("________\n"+
                        "________\n"+
                        "________\n"+
                        "________\n"+
                        "________\n"+
                        "________\n"+
                        "_W______\n"+
                        "B_______\n") === true);
                        
console.log(queenAttack("________\n"+
                        "________\n"+
                        "________\n"+
                        "________\n"+
                        "________\n"+
                        "W_____B_\n"+
                        "________\n"+
                        "________\n") === true);

console.log(queenAttack("________\n"+
                        "________\n"+
                        "___W____\n"+
                        "________\n"+
                        "________\n"+
                        "___B____\n"+
                        "________\n"+
                        "________\n") === true);

// No Attack

console.log(queenAttack("________\n"+
                        "________\n"+
                        "___W____\n"+
                        "________\n"+
                        "________\n"+
                        "_______B\n"+
                        "________\n"+
                        "________\n") === false);

console.log(queenAttack("________\n"+
                        "________\n"+
                        "_____W__\n"+
                        "________\n"+
                        "________\n"+
                        "________\n"+
                        "________\n"+
                        "_B______\n") === false);

// Missing queens

console.log(queenAttack("________\n"+
                        "________\n"+
                        "________\n"+
                        "________\n"+
                        "________\n"+
                        "_B______\n"+
                        "________\n"+
                        "________\n") === undefined);

console.log(queenAttack("________\n"+
                        "________\n"+
                        "___W____\n"+
                        "________\n"+
                        "________\n"+
                        "________\n"+
                        "________\n"+
                        "________\n") === undefined);

console.log(queenAttack("________\n"+
                        "________\n"+
                        "________\n"+
                        "________\n"+
                        "________\n"+
                        "________\n"+
                        "________\n"+
                        "________\n") === undefined);