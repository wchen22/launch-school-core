// Lettercase Percentage Ratio
// Write a function that takes a string and returns an object containing the following three properties:

// the percentage of characters in the string that are lowercase letters
// the percentage of characters that are uppercase letters
// the percentage of characters that are neither
// You may assume that the string will always contain at least one character.

// Examples:

// function letterPercentages(string) {
//   const stats = {
//     lowercase: 0,
//     uppercase: 0,
//     neither: 0
//   };

//   [...string].reduce((stats, letter) => {
//     if (/[a-z]/.test(letter)) {
//       stats.lowercase += 1; 
//     } else if (/[A-Z]/.test(letter)) {
//       stats.uppercase += 1;
//     } else stats.neither += 1;
//     return stats
//   }, stats);

//   Object.keys(stats).forEach(key => {
//     stats[key] = ((100 * stats[key] / string.length).toFixed(2));
//   });

//   return stats;
// }

function letterPercentages(string) {
  const count = string.length;
  return {
    lowercase: matchCount(/[a-z]/g, string),
    uppercase: matchCount(/[A-Z]/g, string),
    neither: matchCount(/[^a-z]/gi, string)
  }
}

function matchCount(regex, string) {
  let matches = string.match(regex) || [];
  return ((matches.length / string.length) * 100).toFixed(2);
}

console.log(letterPercentages('abCdef 123'));
// { lowercase: "50.00", uppercase: "10.00", neither: "40.00" }

console.log(letterPercentages('AbCd +Ef'));
// { lowercase: "37.50", uppercase: "37.50", neither: "25.00" }

console.log(letterPercentages('123'));
// { lowercase: "0.00", uppercase: "0.00", neither: "100.00" }