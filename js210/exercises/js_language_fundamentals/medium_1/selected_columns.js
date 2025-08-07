// Selected Columns

// The getSelectedColumns function selects and extracts specific columns to a new array. Currently, the function is not producing the expected result. Go over the function and the sample runs shown below. What do you think the problem is?

function getSelectedColumns(numbers, cols) {
  var result = [];

  for (var i = 0, length = numbers.length; i < length; i += 1) { // index for the array in arrays (row number)
    for (let j = 0, length = cols.length; j < length; j += 1) { // need to initialize a new length here, otherwise just rewrites current length variable, compromising desired function of outer for loop
      if (!result[j]) { 
        result[j] = []; // creates empty array for each column id
      }

      result[j][i] = numbers[i][cols[j]]; //
    }
  }

  return result;
}

// given the following arrays of number arrays
const array1 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];
const array2 = [[1, 2, 3], [1, 2, 3], [1, 2, 3]];

// `array1` in row/column format
// [[1, 2, 3],
//  [4, 5, 6],
//  [7, 8, 9]]

console.log(getSelectedColumns(array1, [0]));     // [[1]];            expected: [[1, 4, 7]]
console.log(getSelectedColumns(array1, [0, 2]));  // [[1, 4], [3, 6]]; expected: [[1, 4, 7], [3, 6, 9]]
console.log(getSelectedColumns(array2, [1, 2]));  // [[2, 2], [3, 3]]; expected: [[2, 2, 2], [3, 3, 3]]