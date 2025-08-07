// const ASCII_A_AND_Z = {
//   A: 65,
//   Z: 90,
//   a: 97,
//   z: 122
// };

// const ALPHABET_SIZE = 26;

const rotateAsciiChar = (firstCode, lastCode, char, offset) => {
  const charCode = char.charCodeAt(0);
  const rangeSize = lastCode - firstCode + 1
  const rotatedCode = (charCode - firstCode + offset) % (rangeSize) + firstCode;
  return String.fromCharCode(rotatedCode);
}; 
  
function rot13(string) {
  const lowerCaseRotate13 = (char) => rotateAsciiChar(97, 122, char, 13);
  const upperCaseRotate13 = (char) => rotateAsciiChar(65, 90, char, 13);

  let rotatedString = "";
  for (let index = 0; index < string.length; index +=1){
    let currentChar = string[index];

    if (currentChar >= 'A' && currentChar <= 'Z') {
      rotatedString += upperCaseRotate13(currentChar);
    } else if (currentChar >= 'a' && currentChar <= 'z') {
      rotatedString += lowerCaseRotate13(currentChar);
    } else {
      rotatedString += currentChar;
    }
  }

  return rotatedString;
}

console.log(rot13('Teachers open the door, but you must enter by yourself.'));
console.log(rot13(rot13('Teachers open the door, but you must enter by yourself.')));

// const rotateAlphaCodeBy13 = (charCode) => {
//   if (charCode >= 65 && charCode <= 90){
//     return rotateAsciiCode(65, charCode, 13, 26)
//   } else if (charCode >= 97 && charCode <= 122) {
//     return rotateAsciiCode(97, charCode, 13, 26)
//   } else {
//     return charCode;
//   }
// };

// // what reusable function do I want to make from this?
// // rotateAlpha 

// const rotateAlphaBy13 = function(char){
//   let asciiCode = char.charCodeAt(0);
//   if (char >= 'A' && char <= 'Z') {
//     asciiCode = rotateAsciiCode(65, asciiCode, 13, 26) 
//   } else if (char >= 'a' && char <= 'z') {
//     asciiCode = rotateAsciiCode(97, asciiCode, 13, 26) 
//   }

//   return String.fromCharCode(asciiCode);
// };

// // function rotateAlphaChar(offset, char) {
// //   let asciiCode = char.charCodeAt(0);
// //   if (char >= 'A' && char <= 'Z') {
// //     asciiCode = ((asciiCode - ASCII_A_AND_Z['A']) + offset) % ALPHABET_SIZE + ASCII_A_AND_Z['A'];
// //   } else if (char >= 'a' && char <= 'z') {
// //     asciiCode = ((asciiCode - ASCII_A_AND_Z['a']) + offset) % ALPHABET_SIZE + ASCII_A_AND_Z['a'];
// //   }

// //   return String.fromCharCode(asciiCode);
// // }

// console.log(rotateAlphaChar(13, 'a'));