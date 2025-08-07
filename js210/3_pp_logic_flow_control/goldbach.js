// Goldbach Numbers
// Write a function named checkGoldbach that uses Goldbach's Conjecture to log every pair of primes that sum to the number supplied as an argument. The conjecture states that "you can express every even integer greater than 2 as the sum of two primes". The function takes as its only parameter, an integer expectedSum, and logs all combinations of two prime numbers whose sum is expectedSum. Log the prime pairs with the smaller number first. If expectedSum is odd or less than 4, your function should log null.

// Your checkGoldbach function may call the isPrime function you wrote for a previous practice problem.

function isPrime(number){
  if (number <= 1 || (number > 2 && number % 2 === 0)){
    return false;
  }
  for (let candidate = 3; candidate < number; candidate += 1){
    if (number % candidate === 0){
      return false;
    }
  }
  return true;
}

function checkGoldbach(expectedSum) {
  if (expectedSum % 2 === 1 || expectedSum < 4) {
    console.log(null);
  } else {
    for (let i = 2; i <= expectedSum / 2; i += 1){
      if (isPrime(i)) {
        let difference = expectedSum - i;
        if (isPrime(difference)) {
          console.log(`${i} ${difference}`);
        }
      }
    }
  }
}

// Example
checkGoldbach(3);
// logs: null

checkGoldbach(4);
// logs: 2 2

checkGoldbach(10);

checkGoldbach(12);
// logs: 5 7

checkGoldbach(100);
// logs:
// 3 97
// 11 89
// 17 83
// 29 71
// 41 59
// 47 53