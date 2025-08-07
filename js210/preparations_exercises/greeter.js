let rlSync = require('readline-sync');

let name = 'Victor';
greetings = ['Good morning', 'Good Afternoon', 'Good Evening'];

for (let i = 0; i < greetings.length; i++) {
  console.log(`${greetings[i]}, ${name}.`);
}

function request(text) {
  let response = rlSync.question(`Please enter your ${text}\n`);
  return response;
};

console.log(`Hello, ${request('first name')} ${request('last name')}`);