// How Old is Teddy?
// Build a program that randomly generates Teddy's age, and logs it to the console. Have the age be a random number between 20 and 200 (inclusive).

// Example Output:

// Teddy is 69 years old!

let randomAge = 20 + Math.random() * (200 - 20)
console.log(`Teddy is ${Math.round(randomAge)} years old!`);

// Further Exploration
// The randomBetween function used the Math.floor() method. Would it make a difference if the Math.round() method was used instead?

// Also, how can we make the function more robust? What if the user inadvertently gave the inputs in reverse order (i.e., the value passed to min was greater than max)?