// How Big is the Room
// Build a program that asks the user to enter the length and width of a room in meters, and then logs the area of the room to the console in both square meters and square feet.

// Note: 1 square meter == 10.7639 square feet

// Do not worry about validating the input at this time. Use the readlineSync.prompt method to collect user input.

// Example:

// Enter the length of the room in meters:
// 10
// Enter the width of the room in meters:
// 7
// The area of the room is 70.00 square meters (753.47 square feet).

// Further Exploration
// Modify the program so that it asks the user for the input type (meters or feet). Compute for the area accordingly, and log it and its conversion in parentheses.
const readline = require("readline-sync");

const METER_TO_FOOT = 3.28084;
const SQMETER_TO_SQFOOT = METER_TO_FOOT ** 2;

const validUnitInput = input => input === 'meters' || input === 'feet';
const askForUnits = () => readline.question("Are you measuring in meters or feet? ").toLowerCase();

let units = askForUnits();
while (!validUnitInput(units)) {
  console.log('Oops! That is not a valid unit. Please choose either "meters" or "feet".')
  units = askForUnits();
}

const length = parseFloat(readline.question(`Enter the length of the room in ${units}: `));

const width = parseFloat(readline.question(`Enter the width of the room in ${units}: `))

let areaInFeet;
let areaInMeters;

if (units === 'feet') {
  areaInFeet = length * width;
  areaInMeters = areaInFeet / SQMETER_TO_SQFOOT;
  console.log(`The area of the room is ${areaInFeet.toFixed(2)} square feet (${areaInMeters.toFixed(2)} square meters).`)
} else if (units === 'meters') {
  areaInMeters = length * width;
  areaInFeet = areaInMeters * SQMETER_TO_SQFOOT;
  console.log(`The area of the room is ${areaInMeters.toFixed(2)} square meters (${areaInFeet.toFixed(2)} square feet).`)
}


