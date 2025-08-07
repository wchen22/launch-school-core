let studentScores = {
  student1: {
    id: 123456789,
    scores: {
      exams: [90, 95, 100, 80],
      exercises: [20, 15, 10, 19, 15],
    },
  },
  student2: {
    id: 123456799,
    scores: {
      exams: [50, 70, 90, 100],
      exercises: [0, 15, 20, 15, 15],
    },
  },
  student3: {
    id: 123457789,
    scores: {
      exams: [88, 87, 88, 89],
      exercises: [10, 20, 10, 19, 18],
    },
  },
  student4: {
    id: 112233445,
    scores: {
      exams: [100, 100, 100, 100],
      exercises: [10, 15, 10, 10, 15],
    },
  },
  student5: {
    id: 112233446,
    scores: {
      exams: [50, 80, 60, 90],
      exercises: [10, 0, 10, 10, 0],
    },
  },
};

// Percent Grade	Letter Equivalent
// 93 - 100	    A
// 85 - 92	    B
// 77 - 84	    C
// 69 - 76      D
// 60 - 68     	E
// 0 - 59      	F

function letterGrade(percentGrade) {
  const letterPercentRanges = {
    'A': [93, 100],
    'B': [85, 92],
    'C': [77, 84],
    'D': [69, 76],
    'E': [60, 68],
    'F': [0, 59],
  }

  for (grade in letterPercentRanges) {
    let range = letterPercentRanges[grade];
    if (percentGrade >= range[0] && percentGrade <= range[1]) return grade;
  }
}

function sumArray(array) {
  return array.reduce((total, element) => total + element);
}

function getStudentScore(scoreObj) {
  const EXAM_WEIGHT = 0.65;
  const EXERCISE_WEIGHT = 1 - EXAM_WEIGHT;

  let examAverage = sumArray(scoreObj.exams) / scoreObj.exams.length;
  let exerciseTotal = sumArray(scoreObj.exercises);
  
  let integerGrade = Math.round(EXAM_WEIGHT * examAverage + EXERCISE_WEIGHT * exerciseTotal);

  return `${integerGrade} (${letterGrade(integerGrade)})`
}

function getExamSummary(examData) {
  let columnIndices = Object.keys(examData[0]);
  return columnIndices.map(index => {
    let scoresForExam = examData.map(studentExams => studentExams[index]);
    return getExamStatistics(scoresForExam);
  });
}

function getExamStatistics(scoresForExam) {
  let minimum = Math.min(...scoresForExam);
  let maximum = Math.max(...scoresForExam);
  let average = sumArray(scoresForExam) / scoresForExam.length;

  return {
    min: minimum,
    average: average,
    max: maximum,
  }
}

function generateClassRecordSummary(scores) {
  let scoreData = Object.keys(scores).map(student => scores[student].scores);
  let examData = scoreData.map(score => score.exams);

  return {
    studentGrades: scoreData.map(scoreObj => getStudentScore(scoreObj)), 
    exams: getExamSummary(examData),
  };
}

console.log(generateClassRecordSummary(studentScores));

// function calculatePercentGrade(exams, exercises) {
//   let examsAverage = exams.reduce((sum, exam) => sum + exam)/exams.length;
//   let exercisesTotal = exercises.reduce((sum, exercise) => sum + exercise);
//   return Math.round(.65 * examsAverage + .35 * exercisesTotal);
// }

// function examStatistics(scores) {
//   console.log(scores);
//   let stats = scores.map (examScores => {
//     let min = examScores.reduce((min, score) => (score < min) ? score : min);
//     let max = examScores.reduce((max, score) => (score > max) ? score : max);
//     let average = examScores.reduce((sum, score) => sum + score) / examScores.length;

//     return {average: average, minimum: min, maximum: max};
//   });

//   return stats;
// };

// function extractExams(scores) {
//   let gradesByStudent = Object.keys(scores).map( student => {
//     return scores[student].scores.exams;
//   });


//   let examIndices = Object.keys(gradesByStudent[0]);
//   //console.log(examIndices);
//   //console.log(gradesByStudent);

//   let examOutput = examIndices.map(examId => {  // index is 0 1 2 3
//     // i want for each index the return value to be an array containing the grades from the column of gradesByStudent
//     let examScores = gradesByStudent.reduce((arr, student) => { 
//       arr.push(student[examId]);
//       return arr;
//     }, []);
//     //console.log(examScores)
//     return examScores;
//   });

//   return examStatistics(examOutput);
// }
// console.log(extractExams(studentScores));



// function generateClassRecordSummary(scores) {
//   // In: object with each student as a property {
//     // student1: {
//     //   id:
//     //   scores: {
//     //     exams: [] //[50, 80, 60, 90]
//     //     exercises: [] // [10, 0, 10, 10, 0]
//     //   }
//     //  }
//     // }

//   let calculateGrades = Object.keys(scores).map( student => {
//     let exams = scores[student]['scores']['exams'];
//     let exercises = scores[student]['scores']['exercises'];
//     let percentGrade = calculatePercentGrade(exams, exercises);
//     let letterGrade = convertToLetterGrade(percentGrade);
//     return `${percentGrade} (${letterGrade})`;
//   });

//   return calculateGrades;
//   // map of the student keys => 
//     // get exams and exercises array for each
//     // let percentGrade = calculatePercentGrade(exam, exercises)

//   // and also let letterGrade = convertToLetterGrade(percentGrade)
//   // 

//   // exams return array:
//     // Get an array of all exam scores
//     // iterate over with index
//     // output array has average with all grades at that same index


  
  
//   // Out: object {studentGrades, exams}
//     // studentGrades: array with 5 strings format '87 (B)', one for each student in object

//     // exams: array with 4 objects for each exam, with average: minimum: maximum:
// }


// returns:
// {
//   studentGrades: [ '87 (B)', '73 (D)', '84 (C)', '86 (B)', '56 (F)' ],
//   exams: [
//     { average: 75.6, minimum: 50, maximum: 100 },
//     { average: 86.4, minimum: 70, maximum: 100 },
//     { average: 87.6, minimum: 60, maximum: 100 },
//     { average: 91.8, minimum: 80, maximum: 100 },
//   ],
// }