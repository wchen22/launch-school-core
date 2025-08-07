
// function findMin(array) {
//   let left = 0;
//   let right = array.length - 1;
//   let rightmost = array[right];

//   while (left < right) {
//     let mid = Math.floor(left + (right - left) / 2);

//     if (array[mid] > rightmost) {
//       left = mid + 1;
//     } else {
//       right = mid;
//     }
//   }

//   return array[left];
// }

// const arr = [5, 6, 1, 2, 3, 4];
// console.log(findMin(arr));

// const arr1 = [3, 4, 5, 1, 2];
// console.log(findMin(arr1)); // Expected: 1

// const arr2 = [2, 3, 4, 5, 1];
// console.log(findMin(arr2)); // Expected: 1

// const arr3 = [1, 2, 3, 4, 5];
// console.log(findMin(arr3)); // Expected: 1

// const arr4 = [2, 1];
// console.log(findMin(arr4)); // Expected: 1

// function runTests() {
//   console.log(findMin([1, 2, 3, 4, 5]) === 1);
//   console.log(findMin([3, 4, 5, 1, 2]) === 1);
//   console.log(findMin([2, 3, 4, 5, 1]) === 1);
//   console.log(findMin([5, 1, 2, 3, 4]) === 1);
//   console.log(findMin([2, 1]) === 1);
//   console.log(findMin([1, 2]) === 1);
  
//   // Uncomment these if duplicates are possible and handled
//   console.log(findMin([2,2,2,0,1]) === 0);
//   console.log(findMin([1,1,1,1]) === 1);

//   console.log(findMin([10]) === 10);
// }

// runTests();


function findPeak(mountain) {
  let left = 0;
  let right = mountain.length - 1;
  let greatest = -Infinity

  while (left <= right) {
    let mid = Math.floor(left + (right - left) / 2);

    if (mid === 0 || mountain[mid] > mountain[mid - 1]) {
      greatest = mountain[mid];
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }

  return greatest;
}

const mountain1 = [2, 3, 4, 5, 6, 9, 12, 11, 8, 6, 4, 1, 0, 0, 0] 
// 

function findSquareRoot(number) {
  
}

function runTests(){
  const mountains = {
    onlyDecreasing: [3, 2, 1],
    standard: [2, 3, 4, 5, 6, 9, 12, 11, 8, 6, 4, 1],
    onlyIncreasing: [1, 2, 3],
    extendedPeak: [1, 2, 3, 3, 3, 1, 0],
    fromVoila: [2, 3, 4, 5, 6, 9, 12, 11, 8, 6, 4, 1],
  }

  // for (let caseName in mountains) {
  //   console.log(caseName + ' |' + mountains[caseName] + '| ' + findPeak(mountains[caseName]));
  // }

  const squareRoots = {
    onlyDecreasing: [3, 2, 1],
    standard: [2, 3, 4, 5, 6, 9, 12, 11, 8, 6, 4, 1],
    onlyIncreasing: [1, 2, 3],
    extendedPeak: [1, 2, 3, 3, 3, 1, 0],
    fromVoila: [2, 3, 4, 5, 6, 9, 12, 11, 8, 6, 4, 1],
  }

  for (let caseName in squareRoots) {
    console.log(caseName + ' |' + squareRoots[caseName] + '| ' + findPeak(squareRoots[caseName]));
  }

}

runTests();