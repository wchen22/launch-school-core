// Unlucky Days
// Write a function that takes a year as an argument and returns the number of 'Friday the 13ths' in that year. You may assume that the year is greater than 1752 (when the modern Gregorian Calendar was adopted by the United Kingdom). You may also assume that the same calendar will remain in use for the foreseeable future.

/*
RULES
Increase the count when a date in a given year is both a Friday and a 13th
DATA STRUCTURE AND ALGORITHM
Create array with the 12 13ths (year)
  Create an array from 1-12
  Map the 1-12 array => Create date object from date and input year
Reduce that array with a count starting from 0
  -> callback sumOfFridays(total, date)
    -> If the DAY of that date object is Friday, return total + 1
      return total
Return the above reduction
*/
// Examples:

function fridayThe13ths(year) {
  const thirteenths = create13ths(year);
  return thirteenths.filter(isFriday).length;
}

function create13ths(year) {
  const dates = [];
  for (let month = 1; month <= 12; month += 1) {
    dates.push(new Date(`${month}/13/${year}`));
  }
  return dates;
}

function isFriday(date) {
  return date.getDay() === 5;
}

console.log(fridayThe13ths(1986));      // 1
console.log(fridayThe13ths(2015));      // 3
console.log(fridayThe13ths(2017));      // 2