// After Midnight Part 1
// We can use the number of minutes before or after midnight to represent the time of day. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

// The timeOfDay function shown below takes a time argument using this minute-based format, and returns the time of day in 24-hour format ("hh:mm"). Reimplement the function using JavaScript's Date object.

// Examples:
const MINUTES_PER_HOUR = 60;
const HOURS_PER_DAY = 24;
const MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR;

console.log(timeOfDay(0));          // "00:00"
console.log(timeOfDay(-3));         // "23:57"
console.log(timeOfDay(35));         // "00:35"
console.log(timeOfDay(-1437));      // "00:03"
console.log(timeOfDay(3000));       // "02:00"
console.log(timeOfDay(800));        // "13:20"
console.log(timeOfDay(-4231));      // "01:29"
// Note: Disregard Daylight Saving Time, Standard Time, and other complications.

function timeOfDay(deltaMinutes) {
  const milliseconds = 60 * deltaMinutes * 1000;
  const date = new Date(milliseconds);
  const parsedTime = date.toUTCString().split(' ')[4].split(':');
  
  return parsedTime[0] + ':' + parsedTime[1];
}

// function timeOfDay(deltaMinutes) {
//   deltaMinutes = deltaMinutes % MINUTES_PER_DAY;
//   if (deltaMinutes < 0) {
//     deltaMinutes = MINUTES_PER_DAY + deltaMinutes;
//   }

//   let hours = Math.floor(deltaMinutes / MINUTES_PER_HOUR);
//   let minutes = deltaMinutes % MINUTES_PER_HOUR;

//   return `${padWithZeroes(hours, 2)}:${padWithZeroes(minutes, 2)}`;
// }

// function padWithZeroes(number, length) {
//   let numberString = String(number);

//   while (numberString.length < length) {
//     numberString = `0${numberString}`;
//   }

//   return numberString;
// }

// After Midnight Part 2
// As seen in the previous exercise, the time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

// The two functions below do the reverse of the previous exercise. They take a 24-hour time argument and return the number of minutes before or after midnight, respectively. Both functions should return a value between 0 and 1439 (inclusive). Refactor the functions using the Date object.

// Examples:

console.log(afterMidnight('00:00'));       // 0
console.log(beforeMidnight('00:00'));      // 0
console.log(afterMidnight('12:34'));       // 754
console.log(beforeMidnight('12:34'));      // 686
// Note: Disregard Daylight Saving Time, Standard Time, and other irregularities.


function afterMidnight(timeStr) {
  const date = new Date('1/1/2000 ' + timeStr);
  return date.getHours() * MINUTES_PER_HOUR + date.getMinutes();

  // const timeComponents = timeStr.split(':');
  // const hours = parseInt(timeComponents[0], 10);
  // const minutes = parseInt(timeComponents[1], 10);

  // return hours * MINUTES_PER_HOUR + minutes;
}

function beforeMidnight(timeStr) {
  let deltaMinutes = MINUTES_PER_DAY - afterMidnight(timeStr);
  if (deltaMinutes === MINUTES_PER_DAY) {
    deltaMinutes = 0;
  }

  return deltaMinutes;
}