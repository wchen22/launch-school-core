// Student Grade
// Write a program to determine a student’s grade based on the average of three scores you get from the user. Use these rules to compute the grade:

// If the average score is greater than or equal to 90 then the grade is 'A'
// If the average score is greater than or equal to 70 and less than 90 then the grade is 'B'
// If the average score is greater than or equal to 50 and less than 70 then the grade is 'C'
// If the average score is less than 50 then the grade is 'F'
// You may assume that all input values are valid positive integers.

// Example
// // prompts to get the 3 scores
// Enter score 1: 90
// Enter score 2: 50
// Enter score 3: 78

let numberScores = prompt("How many scores do you want to enter? ")

let grades = [];

for (let i = 1; i <= numberScores; i += 1){
  grades.push(Number(prompt(`Enter score ${i}:`)));
}

function computeAverage(grades) {
  return grades.reduce((total, grade) => total + grade, 0) / grades.length;
}

let average = computeAverage(grades);

let grade = 'F';
if (average >= 90) {
  grade = 'A';
} else if (average >= 70) {
  grade = 'B';
} else if (average >= 50) {
  grade = 'C';
}

console.log(`Based on the average of your ${numberScores} scores (${average}) your letter grade is "${grade}".`)


// // log to the console
// Based on the average of your 3 scores your letter grade is "B".

// Further Exploration
// Our solution limits us to exactly three input scores. Modify it to accept any number of scores. To simplify matters, move the computation of the average into a function.