// While version numbers often appear to be decimal numbers, they are, in fact, a convenient notation for a more complicated number system. The following are all legal version numbers:

// 1
// 1.0
// 1.2
// 3.2.3
// 3.0.0
// 4.2.3.0

// Write a function that takes any two version numbers in this format and compares them, with the result of this comparison showing whether the first is less than, equal to, or greater than the second version:

// If version1 > version2, we should return 1.
// If version1 < version2, we should return -1.
// If version1 === version2, we should return 0.
// If either version number contains characters other than digits and the . character, we should return null.

// 0.1 < 1 = 1.0 < 1.1 < 1.2 = 1.2.0.0 < 1.18.2 < 13.37

/**
PROBLEM
  Input: Two version numbers
  Output:
    - version1 > version2 => 1
    - version1 < version2 => -1
    - version1 === version2 => 0
    - if (version1 || version2) has chars other than digits 0-9 and '.' => null
  Questions:
    - Do we have to handle
      - argument types that are not strings? (e.g. number types like 1.0, 2)
      - argument arity?
      - empty strings?
      - Improperly formatted valid strings? (e.g. '.4.1' or '4.2.' or '2.3..1 )
  Rules:
  - We can always expect two strings
  - Return null if either string has chars other than [0-9.]
    - Return null if ends with '.', begins with '.', or has more than one '.' in a row
  - Two version numbers are the same if one of them is the other with 1 or more `.0` appended to it
  - Version numbers are read left to right, with "subversions" separated by '.'
  - At each sub-version, a number is >, <, === to another based on the number representation of the string representation of that sub-version

  Data Structures:
  1) Two strings
    - Check if any invalid chars (everything but digits and '.')
    - Check if any improper format (leading, ending, or more than one '.' at once)
    > Return null if so
  2) Array with components of each version number as numbers ('1.18.2' => [1, 18, 2])
  3) Return -1, 0, or 1 based on compare versionComponents
  
  HELPERS
  validVersionNumber(string) // true or false

  versionToArray(string) // '1.18.2' => [1, 18, 2]

  compareVersionComponents(array1, array2) => -1, 0, 1

  MAIN ALGORITHM
  - if !validVersionNumber(input) return null
  - Transform the input strings into array of version components
  - Compare the two version components
  - Return result of that comparison
*/

function validVersionNumber(string) {
  const invalidCharsRegex = /[^0-9.]/;
  if (invalidCharsRegex.test(string)) return false;

  const invalidFormatRegex = /(^\.|\.$|\.{2,})/;
  if (invalidFormatRegex.test(string)) return false;

  return true;
}

// console.log(validVersionNumber('1.9.234.00.0'))

function versionToArray(string) { // input is valid version number
  // return array of version components as numbers
  return string.split('.').map(subversion => Number(subversion));
}

// console.log(versionToArray('1.22.0.333'));

function compareVersionArrays(array1, array2) { // [1, 2, 0], [1, 2]
  // going position by position in each array
    // if the value at the array2 position is greater than the value at the array1 position return -1
    // if it's less, return 1
    // if both array2 or array1 [index] not found return 0
    // if array2 is found but not array1

  // get the longest array length
    // iterate over longest array length
      // if array1 index is <> array2 index return -1 or 1
      // if array1[index] and !array2[index]
        // if any remaining array1 components are > 0 return 1
        // else return 0
      // if array2[index] and !array1[index]
        // if any remaining array2 components are > 0 return -1
        // else return 0

  let maxLength = Math.max(array1.length, array2.length);
  for (let index = 0; index < maxLength; index += 1) {
    let [first, second] = [array1[index], array2[index]];
    if (first !== undefined && second !== undefined) {
      if (first < second) return -1;
      if (first > second) return 1;
    } else if (second === undefined) {
      if (array1.slice(index).every(num => num === 0)) return 0;
      return 1;
    } else if (first === undefined) {
      if (array2.slice(index).every(num => num === 0)) return 0;
      return -1;
    }
  }
  return 0;
}

function compareVersions(version1, version2) {
  if (!validVersionNumber(version1) || !validVersionNumber(version2)) return null;

  let firstArray = versionToArray(version1);
  let secondArray = versionToArray(version2);

  return compareVersionArrays(firstArray, secondArray);
}

let tests = [
  {inputs: ['0.1', '1.0'], expected: -1},
  {inputs: ['1', '1.0'], expected: 0},
  {inputs: ['1.1', '1.2'], expected: -1},
  {inputs: ['1.2', '1.2.0.0'], expected: 0},
  {inputs: ['2.1', '1.0'], expected: 1},
  {inputs: ['1.2.0.0', '1.18.2'], expected: -1},
  {inputs: ['1.18.2', '13.37'], expected: -1},
  {inputs: ['0.1,3', '1.0'], expected: null},
  {inputs: ['0.1', '.1.0'], expected: null},
  {inputs: ['0.1.', '1.0'], expected: null},
  {inputs: ['0.1', '1..0'], expected: null},

]

tests.forEach(test => {
  console.log(compareVersions(...test.inputs) === test.expected)
});

console.log(compareVersions('1', '1'));            // 0
console.log(compareVersions('1.1', '1.0'));        // 1
console.log(compareVersions('2.3.4', '2.3.5'));    // -1
console.log(compareVersions('1.a', '1'));          // null
console.log(compareVersions('.1', '1'));           // null
console.log(compareVersions('1.', '2'));           // null
console.log(compareVersions('1..0', '2.0'));       // null
console.log(compareVersions('1.0', '1.0.0'));      // 0
console.log(compareVersions('1.0.0', '1.1'));      // -1
console.log(compareVersions('1.0', '1.0.5'));      // -1 (this doesn't work yet)