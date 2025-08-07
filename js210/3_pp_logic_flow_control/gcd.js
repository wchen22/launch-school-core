// Greatest Common Divisor
// Create a function that computes the Greatest Common Divisor of two positive integers.
console.log('test');
function gcd(num1, num2){
  // find the smallest number
  let smaller_num = (num1 > num2) ? num2 : num1;
  let larger_num = (num1 > num2) ? num1 : num2;

  // find all its factors, put in array from largest to smalest
  let divisors = [];
  for (let i = smaller_num; i >= 1; i -= 1){
    if (smaller_num % i === 0) {
      divisors.push(i);
    }
  }
  // from the largest down, test if each element is a divisor of the larger number. return it if so
  for (let j = 0; j < divisors.length; j += 1){
    let candidate = divisors[j];
    if (larger_num % candidate === 0){
      return candidate;
    }
  }
}

// Euclidean algorithm

function gcd(num1, num2) {
  var temp;

  while (num2 !== 0){
    temp = num2;
    num2 = num1 % num2;
    num1 = temp;
  }

  return num1;
}

// Example
console.log(gcd(12, 4));   // 4
console.log(gcd(15, 10));  // 5
console.log(gcd(9, 2));    // 1
console.log(gcd(10, 15));  // 5



// Further Exploration 
// The examples all put the larger number first. Do you think the program will still work if you reverse the order and place the smaller number first?
// -> Yes, if num1 is smaller then num1 % num2 will equal num1, so the first loop essentially swaps the numbers

// Our solution works with only two numbers. Can you expand it to accept an array of two or more numbers instead? Hint: the GCD is associative. To compute the GCD of 12, 4, and 8, for instance, you can compute:

// gcd(12, gcd(4, 8));  // 4
// You can also compute it with:

// gcd(gcd(12, 4), 8);  // 4

function gcd(...args) {
  if (Array.isArray(args[0])) {
    args = args[0];
  }
  var last_gcd;

  while (args.length >= 2) {
    last_gcd = gcd2(args.pop(), args.pop());
    args.push(last_gcd);
  }

  return last_gcd;

  function gcd2(num1, num2) {
    var temp;
  
    while (num2 !== 0){
      temp = num2;
      num2 = num1 % num2;
      num1 = temp;
    }
  
    return num1;
  }
}

console.log(gcd(10, 15, 25));  // 5
console.log(gcd([144, 64, 32]));  // 16
console.log(gcd(144, 64, 32));  // 16


