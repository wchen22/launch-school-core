// Problem Description
// Write a function that returns the position of the closest active opponent. If two opponents are equidistant, return the opponent with the higher position on the board.


/**
PROBLEM:
  Given an object of opponent names and values; as well as a position number, return the position of the opponent closest to that position number.

  Input:
    Object {'Opponent Name' : 100, ...}
  Output:
    Integer representing the position from the object closest to position argument
  
  Rules: If the object has two positions equidistant, return the one that is 'higher'

  Questions:
    Can positions be negative?
    Should we always expect two arguments: an object and an integer?
      Will the object ever be empty?
      Can object values have other types aside from numbers and null?
      Will object values (positions) always be integers?
    What does 'higher position' mean? Does it just mean whether the integer value is greatest?
      Other interpretation: has to do with the opponent name?
    Can I assume that closest means the distance as measured by the difference between integer values of positions?
    Can two opponents have the same position? If so, which should I return?
    Can all opponents have null positions? If so what should I return?


DATA STRUCTURE, ALGORITHM
- Object whose values we want to compare against an integer. Names not needed
- Get an array of the object values
- Return the value from that array which is closest to 'our' position
  - If there is a tie for closest, return the greater one

- Approach 1:
  - Initialize a 'closest difference' variable
  - Initialize a closest position variable
  - Filter positions for numbers, and sort highest to lowest
  - Iterate through the list of positions, greatest to lowest
    - Calculate the absolute difference between the opp position and our position
      - If it is less than closestDiff, replace closestDiff and closestPosition
  - Return closest position
*/

function findClosestOpponent(positions, position) {
  let closestDifference = Infinity;
  let closestPosition;

  let activePositions = Object.values(positions)
    .filter(position => typeof(position) === 'number');

  activePositions.sort((a, b) => b - a);

  activePositions.forEach(opponentPosition => {
    let difference = Math.abs(opponentPosition - position);
    if (difference < closestDifference) {
      closestDifference = difference;
      closestPosition = opponentPosition;
    }
  });

  return closestPosition || null;
}

// Standard case
console.log(findClosestOpponent({
  "Opponent 1" : 1,
  "Opponent 2" : 15,
  "Opponent 3" : 37
}, 10)); // 15

// Equidistant, return 'higher' position
console.log(findClosestOpponent({
  "Opponent 1a" : 1,
  "Opponent 1b" : 5
}, 3)); // 5

// Ignore null value
console.log(findClosestOpponent({
  "Opponent 1a" : 1, "Opponent 1b" : 5,
  "Opponent 1c" : 50, "Opponent 1d" : 100, "Opponent 1e" : null
}, 150)); // 100

// Empty object
console.log(findClosestOpponent({

}, 30)); // null

// Different format opponent names
console.log(findClosestOpponent({
  "Atlas" : 1,
  "Luna" : 15,
  "" : 37
}, 10)); // 15

