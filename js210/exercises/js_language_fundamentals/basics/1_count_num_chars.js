let rlSync = require('readline-sync');

let phrase = rlSync.question("Please enter a phrase: ");

//  console.log(`There are ${phrase.length} characters in "${phrase}".`);

count_chars = phrase.replace(/[^/a-zA-Z]/g, '').length;

console.log(`There are ${count_chars} characters in ${phrase}`);