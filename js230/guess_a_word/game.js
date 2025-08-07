// The game must select a random word from a predefined list of words (e.g., ['apple', 'banana', 'orange', 'pear']).
// The selected word should be stored as an array of letters (e.g., ['a', 'p', 'p', 'l', 'e'])
// The current state of the word being guessed should be known. For example, if we're guessing apple and we've guessed a, b, and e, we should know that the current state is a, _, _, _, e.
// The game needs to keep track of guesses made, both correct and incorrect.
// The game should be able to know when the player has won or lost, or if the game isn't over yet.
// The maximum number of incorrect guesses is 6.
// The game should provide a makeGuess method that takes a letter as an argument and updates the game state accordingly.
// If we run out of words, instantiating a new game object should throw an error.

class Game {
  static WORDS = ['apple', 'banana', 'orange', 'pear'];
  static NUMBER_GUESSES = 6;
  static getRandomWord = function() {
    let remainingWords = Game.WORDS.length;
    if (remainingWords === 0) throw new Error('No more words available!');
    let randomIndex = Math.floor(remainingWords * Math.random());
    return Game.WORDS.splice(randomIndex, 1)[0];
  }

  static notALetter(letter) {
    return !/[a-z]/.test(letter.toLowerCase());
  }

  constructor() {
    this.word = Game.getRandomWord().split('');
    this.remainingGuesses = Game.NUMBER_GUESSES;
    this.guesses = [];
    this.currentState = Array(this.word.length).fill(null);
  }

  guessedAllLetters() {
    return this.word.join('') === this.currentState.join('');
  }

  makeGuess(guess) {
    guess = guess.toLowerCase();
    if (Game.notALetter(guess)) return;
    if (this.guesses.includes(guess)) return;

    this.guesses.push(guess);

    if (this.word.includes(guess)) {
      this.word.forEach((letter, index) => {
        if (letter === guess) this.currentState[index] = letter;
      });
    } else this.remainingGuesses -= 1;

    console.log('Current guesses: ' + this.guesses)
    console.log('Current state: ' + this.currentState)
    console.log(this.remainingGuesses);

    if (this.guessedAllLetters()) console.log('You won!');
    if (this.remainingGuesses === 0) console.log('You lost!');

    // return if it's in this.guesses already
      // iterate over this.word with index
        // if it matches,set corresponding index of cufrent state to letter
      //add it to guesses
      // decrease remainingGuesses

      // if won() log yay
      // if lost() log you lost
  }
}


let newGame = new Game();
console.log(newGame.word)
newGame.makeGuess('a');
newGame.makeGuess('p')
newGame.makeGuess('l')
newGame.makeGuess('e')
newGame.makeGuess('r')
newGame.makeGuess('z')
newGame.makeGuess('q')


console.log(Game.notALetter('d'));
console.log(Game.notALetter('1'));