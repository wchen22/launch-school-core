// The Rail Fence cipher is a form of transposition cipher that gets its name from the way in which it's encoded. It was already used by the ancient Greeks.

// In the Rail Fence cipher, the message is written downwards on successive "rails" of an imaginary fence, then moving up when we get to the bottom (like a zig-zag). Finally the message is then read off in rows.

// For example, using three "rails" and the message "WE ARE DISCOVERED FLEE AT ONCE", the cipherer writes out:

// W . . . E . . . C . . . R . . . L . . . T . . . E
// . E . R . D . S . O . E . E . F . E . A . O . C .
// . . A . . . I . . . V . . . D . . . E . . . N . .

// Then reads off:
// WECRLTEERDSOEEFEAOCAIVDEN

// Implement encoding and decoding for the rail fence cipher.

/*
PROBLEM
Description: 
-Given a message and a number of rails, encode it into a rails cipher and return it
INPUT:
# STRING with a message, NUMBER of rails
Q: Will the message ever be blank? If so how to handle?
  A: Yes, return a blank string
Q: Can the message contain upper and lower-case characters?
  A: Yes
Q: Can the message contain punctuation? How should I treat it?
  A: Yes - removed from encoding
Q: Can the number of rails be 0 or 1?
  A: 1 or more
Q: What to do with 1 rail?
Q: Will I always receive these two arguments
OUTPUT:
# STRING that is rail-cipher encoded

RULES:
- Spaces are removed before encoding
Q: What happens if the number of rails is greater than the message length?
  A: the 'encoded' message will be the same as the original message

DATA STRUCTURES AND ALGORITHMS:
# STRING message to encode, NUMBER of rails
# STRING cleaned message without punctuation
  - replace all non [a-z]/i characters with ''
# NUMBER length of cleaned string
# ARRAY (provided # of rails) of ARRAYS (characters in each rail of length from last step)
- Iterate over the indices of the string, which are the same as the indices of each rail we want
  - HELPER Set a railIndex to getNextRailIndex() Get the next diagonal index
    - Inputs: Number of rails, last diagonal index + direction OR horizontal index
  - Start with increaseRailIndex = true
  - Start with currentIndex = -1
  - If increaseRailIndex,
    - currentIndex += 1
    - if currentIndex is maxed out, change increaseRailIndex to false
    > return currentIndex
  - Else
    - currentIndex -= 1
    - if currentIndex is 0 change inreaseRailIndex to true
    - return currentIndex

  - At each position, fill it with the current letter from the cleaned message
# ARRAY of strings from each rail: map the array of rails, rail =>
  > Return the rail concatenated into a string
> ARRAY of rail strings joined into a STRING
*/

function nextRailIndex(numberRails) {
  let increasing = true;
  let currentIndex = -1

  return function() {
    if (numberRails === 1) return 0;
    if (increasing) {
      currentIndex += 1;
      if (currentIndex === numberRails - 1) increasing = false;
    } else if (!increasing) {
      currentIndex -= 1;
      if (currentIndex === 0) increasing = true;
    }
    return currentIndex;
  };
}

function createRailsArray(numberRails, railLength) {
  let rails = [];

  for (let railIndex = 0; railIndex < numberRails; railIndex += 1) {
    rails.push(new Array(railLength));
  }

  return rails;
}

function encode(message, numberRails) {
  if (message === '') return '';
  let letters = message.replace(/[^a-z]/ig, '');
  const railLength = letters.length;
  const rails = createRailsArray(numberRails, railLength);

//   - Iterate over the indices of the string, which are the same as the indices of each rail we want

  let railIndex = nextRailIndex(numberRails);

  [...letters].forEach((letter, index) => rails[railIndex()][index] = letter);

  return rails.map(rail => rail.join('')).join('');

} // We are discovered... => WECRLTEERDSOEEFEAOCAIVDEN

console.log(encode("")) // ''

// Standard example
console.log(encode("WE ARE DISCOVERED FLEE AT ONCE", 3)) // 'WECRLTEERDSOEEFEAOCAIVDEN'

console.log(encode("WE ARE DISCOVERED FLEE AT ONCE", 4)) //


// // W . . . E . . . C . . . R . . . L . . . T . . . E
// . E . R . D . S . O . E . E . F . E . A . O . C .
// . . A . . . I . . . V . . . D . . . E . . . N . .


// Length of the rails is same as the cleaned string (punctuation, spaces removed)
// Create three arrays of same length
// Traverse the array of arrays on diagonals and fill each spot:
//  Iterate from 0 up to and not incl length and push into that index for the active rail the current letter
// Join the elements of the arrays, then join the arrays


// With punctuation
console.log(encode("WE ARE_DISCOVERED FLEE AT 'ONCE", 3)) // 'WECRLTEERDSOEEFEAOCAIVDEN'

// Lower case as well
console.log(encode("wE ARE DISCOVERED fLEE AT ONCE", 3)) // 'wECRLTEERDSOEEfEAOCAIVDEN'

// 1 Rail
console.log(encode("single", 1)) // 'single'
console.log(encode("One rail only", 1)) // 'Onerailonly'

// More rails than letters
console.log(encode("Shorttext", 10)) // 'Shorttext'

// More rails than letters
console.log(encode("Short text", 10)) // 'Shorttext'


// DECODE

function decode(cipher, numberRails) {
  if (cipher === '') return '';
  
  let railLength = cipher.length;
  let rails = createRailsArray(numberRails, railLength);
  let characters = [...cipher];
  let decoded = '';

  let railIndex = nextRailIndex(numberRails);

  characters.forEach((_, index) => rails[railIndex()][index] = true);

  rails.forEach(rail => {
    rail.forEach((slot, index) => {
      if (slot === true) rail[index] = characters.shift();
    });
  });

  railIndex = nextRailIndex(numberRails);
  [...cipher].forEach((_, index) => decoded += rails[railIndex()][index]);

  return decoded;
} 

console.log(decode('', 5)) // ''
// More rails than letters
console.log(decode("Shorttext", 10)) // 'Shorttext'

console.log(decode('wECRLTEERDSOEEfEAOCAIVDEN', 3)) // "wE ARE DISCOVERED fLEE AT ONCE"
// length is 25, rails 3
// 3 rails of length 25
// For first rail, iterate over the indices starting at 0, with a step of numberRails, up to end of the rail
  // shift the character of the string and input it at that index of current rail
// iterate over the railIndices 0 to numberRails-1
  // current rail is rails[railIndex]
  // currentStep is numberRails
  // iterate from railIndex to last index of the row, step by currentStep
    // element is shifted from the string chars
    // place shifted element into current iteration index
  // currentStep - 2
  // 



// "wE ARE DISCOVERED fLEE AT ONCE", 4

// w . . . . . I . . . . . R . . . . . E . . . . . E // first row starts at 0,  can fit remaining # of slots / 6
//  0,   6,    12,    18,    24
//-1,1  4,7  11, 13  17,19  23, 25 // then exclude -1 and 25 cause out of bounds
// 
// . E . . . D . S . . . E . E . . . E . A . . . C . // second row starts at 1, 
// . . A . E . . . C . V . . . D . L . . . T . N . . 
// . . . R . . . . . O . . . . . f . . . . . O . . . // last row starts at 3, can fit remaining slots / 6

// for first and last rows, starts with step of 2 for going up and down
// when # of rails goes up to 3, step of first and last rows increases to 4 (one additional trip each way)
  // intermediate row: 2/2 alternating step
// when # of rails goes up to 4, step goes up to 6
  // intermediate rows: 4/2 alternating step, 2/4 alternating step

// w . A . . . . . . . . . . . . . . . . . . . . . . 
// . E . R . . . . . . . . . . . . . . . . . . . . . 


// calculate initialStep (numberRails)
// 2 rails: increase by 1, decrease by 0 -> // (2-1) * 2 - 1
// 3 rails: increase by 2, decrease by 1 -> 3 spaces // (3-1) * 2 - 1 = 3
// 4 rails: increase by 3, decrease by 2 -> 5 spaces // (4-1) * 2 - 1 = 5
// return (numberRails - 1) * 2
// fill out first row with 0, +initialStep
// map first Row with index
  // wherever there is a value
    // increase and decrease index by 1






