// Place A Bet
// The function placeABet below accepts a guess from the user between 1 and 25. The function should determine a winning number and return a message to the user indicating whether he/she entered a winning guess. When you try to invoke placeABet, an error is raised. Fix the bug and explain what caused it.

// Copy Code

const readline = require('readline-sync');
function placeABet(guess) {
  function generateRandomInt() {
    return Math.floor(Math.random() * 25) + 1;
  }; // this was originally wrapped in parentheses, making it a function expression. Function expression names can only be referenced from within the function - to reference it outside, it has to be assigned a variable.

  const winningNumber = generateRandomInt();

  if (guess < 1 || guess > 25) {
    return 'Invalid guess. Valid guesses are between 1 and 25.';
  }

  if (guess === winningNumber) {
    return "Congratulations, you win!";
  } else {
    return "Wrong-o! You lose.";
  }
}

const userGuess = parseInt(readline.question('Input a guess between 1-25'), 10);
// alert(placeABet(userGuess));
console.log(placeABet(userGuess));