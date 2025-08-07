let rlSync = require('readline-sync');
let age = Number(rlSync.question("How old are you?\n"));

let future_years = 10;

for (; future_years <= 40; future_years += 10){
  console.log(`In ${future_years} years, you will be ${future_years + age} years old.`);
}