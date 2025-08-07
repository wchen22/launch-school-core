function rot13(string) {
  const ASCII_VALS = {
    A: 65,
    a: 97
  }
  
  const rotateBy13 = (baseCode, charCode) => ((charCode - baseCode) + 13) % 26 + baseCode;

  let rotatedString = "";
  for(let index = 0; index < string.length; index += 1) {
    let asciiCode = string[index].charCodeAt(0);

    if (asciiCode >= 'A' && asciiCode <= 'Z') {
      asciiCode = rotateBy13(ASCII_VALS['A'], asciiCode);
    } else if (asciiCode >= 'a' && asciiCode <= 'z') {
      asciiCode = rotateBy13(ASCII_VALS['a'], asciiCode);
    }

    rotatedString += String.fromCharCode(asciiCode);
  }

  return rotatedString;
}
// Declare a blank output string
// Iterate over the string characters
// if it is a modern english alphabet letter, e.g. if it falls in one of these ascii ranges:
  // Uppercase: 65-90
  // Lowercase: 97-122
  // Then do a rotation
    // 70 - > 83 (65 + (10 + 13))
    // 80 -> 65 + 3 = 68 (65 + (16 + 13 % 26))


console.log(rot13('Teachers open the door, but you must enter by yourself.'));

// logs:
// Grnpuref bcra gur qbbe, ohg lbh zhfg ragre ol lbhefrys.

console.log(rot13(rot13('Teachers open the door, but you must enter by yourself.')));

// logs:
// Teachers open the door, but you must enter by yourself.