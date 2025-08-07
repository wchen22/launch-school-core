// Assign Treats to Pets
// Imagine you're a pet owner wanting to give treats to your pets. Each pet has a specific appetite level represented by an array appetite[i], which is the minimum size of a treat the pet will be happy with. Each treat has a size represented by an array treats[j]. A pet will be satisfied if the size of the treat treats[j] is greater than or equal to its appetite level appetite[i]. Your goal is to maximize the number of satisfied pets and output the number of satisfied pets in the end.

function assignTreats(appetites, treats) {
  appetites.sort((a, b) => a - b);
  treats.sort((a, b) => a - b);

  let petIndex = 0;
  let treatIndex = 0;
  let satisfiedPets = 0;

  while (petIndex < appetites.length && treatIndex < treats.length) {
    if (treats[treatIndex] >= appetites[petIndex]) {
      satisfiedPets += 1;
      petIndex += 1;
      treatIndex += 1;
    } else treatIndex += 1;
  }

  return satisfiedPets;
}

// Example test cases:
console.log(assignTreats([3, 4, 2], [1, 2, 3]) === 2);
// don't want to waste a big treat on a small appetite pet - if the 10 is used to feed the 1, will output 3 instead of 4
console.log(assignTreats([1, 3, 4, 2], [10, 1, 2, 3]) === 4);
console.log(assignTreats([1, 5], [5, 5, 6]) === 2);
console.log(assignTreats([1, 2, 3], [3]) === 1);
console.log(assignTreats([2], [1, 2, 1, 1]) === 1);
console.log(assignTreats([4, 3, 1], [2, 1, 3]) === 2);
console.log(assignTreats([1,2,3], [1,2,3]) === 3);
console.log(assignTreats([4, 5, 6], [1,2,3]) === 0);

// All test cases should log true.