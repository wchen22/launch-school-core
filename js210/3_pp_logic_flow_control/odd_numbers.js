// Write a function that takes a positive integer as an argument, and logs all the odd numbers from 1 to the passed in number (inclusive). All numbers should be logged on separate lines.

function logOddNumbers(highest) {
  for (let i = 1; i <= highest; i+=1){
    if (i % 2 === 1){
      console.log(i);
    }
  }
}

// You can remove the conditional inside the loop and increment currentNumber by 2 with each step, instead of 1. How would you write code to do that?

function logOddNumbers(highest){
  for (let i = 1; i <= highest; i += 2){
    console.log(i);
  }
}

// Instead of a conditional that checks for odd numbers, you can write a conditional that checks for even numbers, but skips them with the continue statement. How would you write your code?

function logOddNumbers(highest){
  for (let i = 1; i <= highest; i += 1){
    if (i % 2 === 0){
      continue;
    }
    console.log(i);
  }
}

// logOddNumbers(19);


// Multiples of 3 and 5

// Write a function that logs the integers from 1 to 100 (inclusive) that are multiples of either 3 or 5. If the number is divisible by both 3 and 5, append an "!" to the number.

function multiplesOfThreeAndFive(){
  for (let currentNumber = 1; currentNumber <= 100; currentNumber += 1){
    if (currentNumber % 3 === 0 && currentNumber % 5 === 0){
      console.log(`${currentNumber}!`);
    } else if (currentNumber % 3 === 0 || currentNumber % 5 === 0){
      console.log(currentNumber);
    }
  }
}

//For additional practice, how would you change your function so it takes, as arguments, the range of numbers it should check?

function multiplesOfThreeAndFive(lowest, highest){
  for (let currentNumber = lowest; currentNumber <= highest; currentNumber += 1){
    if (currentNumber % 3 === 0 && currentNumber % 5 === 0){
      console.log(`${currentNumber}!`);
    } else if (currentNumber % 3 === 0 || currentNumber % 5 === 0){
      console.log(currentNumber);
    }
  }
}

// Example
// multiplesOfThreeAndFive(49, 200);

// // output on console
// '3'
// '5'
// '6'
// '9'
// '10'
// '12'
// '15!'
// // … remainder of output omitted for brevity

// Print Multiples
// Write a function logMultiples that takes one argument number. It should log all multiples of the argument between 0 and 100 (inclusive) that are also odd numbers. Log the values in descending order.

// You may assume that number is an integer between 0 and 100.
function logMultiples(number){
  for (let i = 100; i >= number; i -= 1){
    if (i % number === 0 && i % 2 === 1){
      console.log(i);
    }
  }
}

// This solution must step through every number between 100 and 0. Alternatively, you can determine the number's largest multiple that is less than 100, then start the loop with that multiple. With each iteration of the loop, you can decrement the number by the argument; when the result is negative, you can quit.

// As above, we must check each multiple to determine whether it is odd. If it is odd, we log it.

// Math.floor(100 / number) * number returns the largest multiple of number that is between 0 and 100. If you're not familiar with the floor method, see the documentation.

function logMultiples(number){
  let largest_multiple = Math.floor(100 / number);
  for (let multiple = largest_multiple; multiple >= 1; multiple -= 1){
    let candidate = multiple * number;
    if (candidate % 2 === 1){
      console.log(candidate);
    }
  }
}

// logMultiples(17);
// // output (5x, 3x and 1x)
// 85
// 51
// 17

// logMultiples(21);
// // output (3x and 1x)
// 63
// 21

// FizzBuzz
// Write a function that iterates over the integers from 1 to 100, inclusive. For multiples of three, log "Fizz" to the console. For multiples of five, log "Buzz". For numbers which are multiples of both three and five, log "FizzBuzz". For all other numbers, log the number.

// Your output should look like this:

function fizzbuzz(){
  for (let currentNumber = 1; currentNumber <= 100; currentNumber += 1){
    if (currentNumber % 3 === 0 && currentNumber % 5 === 0){
      console.log("FizzBuzz");
    } else if (currentNumber % 3 === 0){
      console.log("Fizz");
    } else if (currentNumber % 5 === 0){
      console.log("Buzz");
    } else {
      console.log(currentNumber);
    }
  }
}

// fizzbuzz();

// console output
// 1
// 2
// Fizz
// 4
// Buzz
// Fizz
// 7
// 8
// Fizz
// Buzz
// 11
// Fizz
// 13
// 14
// FizzBuzz
// 16
// 17
// Fizz
// … rest of output omitted for brevity

// Prime Check
// Write a function that takes a number argument, and returns true if the number is prime, or false if it is not.

// You may assume that the input is always a non-negative integer.

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

// console.log(isPrime(1));   // false
// console.log(isPrime(2));   // true
// console.log(isPrime(3));   // true
// console.log(isPrime(43));  // true
// console.log(isPrime(55));  // false
// console.log(isPrime(0));   // false

// XOR
// For boolean values, the || operator returns true if either or both of its operands are true, false if both operands are false. The && operator, on the other hand, returns true if both of its operands are true, and false if either operand is false. This works great until you need only one of two conditions to be true, the so-called "exclusive or", or XOR.

// Write a function named isXor that takes two arguments, and returns true if exactly one argument is truthy, false otherwise. Your function should work with the boolean values of true and false, but also any JavaScript values based on their "truthiness".

// Revisit this lesson for a refresher on how JavaScript does logical operations of || and &&.

function isXor(first, second){
  let result = !((first && second) || (!first && !second));
  console.log(result);
}

isXor(false, true);     // true
isXor(true, false);     // true
isXor(false, false);    // false
isXor(true, true);      // false


isXor(false, 3);        // true
isXor('a', undefined);  // true
isXor(null, '');        // false
isXor('2', 23);         // false