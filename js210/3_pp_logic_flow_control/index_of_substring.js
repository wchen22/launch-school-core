// Index of Substring
// Write two functions that each take two strings as arguments. Their expected behaviors are as follows:

// The indexOf function searches for the first instance of a substring in firstString that matches the string secondString, and returns the index of the character where that substring begins.

// The lastIndexOf function searches for the last instance of a substring in firstString that matches the string secondString, and returns the index of the character where that substring begins.

// Both functions return -1 if firstString does not contain the substring specified by secondString.

function indexOf(firstString, secondString) {
  const firstStringIsMatchedAt = (position, substring) => {
    for (let index = position; index < position + secondString.length; index += 1){
      const subStringCharToCheck = substring[index - position];
      if (subStringCharToCheck !== firstString[index]) {
        return false;
      }
    }
    return true;
  }

  for (let index = 0; index < firstString.length; index += 1){
    if (firstStringIsMatchedAt(index, secondString)) {
      return index;
    }
  }
  return -1;
}

function lastIndexOf(firstString, secondString) {
  // statements
  // could iterate backwards from firstString end offset by secondString length
    // strToCheck would be current index plus secondString length
    //if indexOf(strToCheck, secondString) is not -1
      // return current index
  let strToCheck = "";
  for (let index = firstString.length - 1; index >= 0; index -= 1){
    for (let j = index; j < index + secondString.length; j += 1) {
      strToCheck += firstString[j];
    }
    if (indexOf(strToCheck, secondString) === -1) {
      strToCheck = "";
    } else {
      return index;
    }
  }
  return -1
}

console.log(indexOf('Some strings', 's'));                      // 5
console.log(indexOf('Blue Whale', 'Whale'));                    // 5
console.log(indexOf('Blue Whale', 'Blute'));                    // -1
console.log(indexOf('Blue Whale', 'leB'));                      // -1

console.log(lastIndexOf('Some strings', 's'));                  // 11
console.log(lastIndexOf('Blue Whale, Killer Whale', 'Whale'));  // 19
console.log(lastIndexOf('Blue Whale, Killer Whale', 'all'));    // -1