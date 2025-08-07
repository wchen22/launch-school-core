// Implement a function that takes a string as an argument and returns a new string that contains the original string in reverse.

function reverse(string) {
  console.log([...string].reverse().join(''));
}

reverse('hello');                  // returns "olleh"
reverse('The quick brown fox');    // returns "xof nworb kciuq ehT"

// Acronym
// Write a function that generates and returns an acronym from a string of words. For example, the function should return "PNG" for the string "Portable Network Graphics". Count compound words (words connected with a dash) as separate words.

function acronym(string) {
  console.log(string.split(/[ -]/).map(word => word[0].toUpperCase()).join(''));
}

acronym('Portable Network Graphics');                  // "PNG"
acronym('First In, First Out');                        // "FIFO"
acronym('PHP: HyperText Preprocessor');                // "PHP"
acronym('Complementary metal-oxide semiconductor');    // "CMOS"
acronym('Hyper-text Markup Language');     // "HTML"

// Email Validation
// Implement a function that checks whether an email address is valid. An email address has two parts: A "local part" and a "domain part." An @ sign separates the two parts: local-part@domain-part. The local part is the name of the mailbox; this is usually a username. The domain part is the domain name (e.g., gmail.com, yahoo.com.ph, or myCompanyName.com). The domain name contains a server name (sometimes called the mail server name) and a top-level domain (.com, .ph, etc.).

// For this practice problem, use the following criteria to determine whether an email address is valid:

// There must be one @ sign.
// The local part must contain one or more letters (A-Z, a-z) and/or digits (0-9). It may not contain any other characters.
// The domain part must contain two or more components with a single dot (.) between each component. Each component must contain one or more letters (A-Z, a-z) only.
// To keep things simple, you don't need to check whether the domain part or top-level domain is "real" or "official".

// Note: don't use this criteria for real email validation logic in your programs. We are using greatly simplified criteria to let you concentrate on the fundamentals of JavaScript, and not on the specifics of email addresses.

function isValidEmail(email) {
  let parts = email.split('@');
  if (parts.length !== 2) return false;
  let [local, domain] = parts;

  let validLocal = !!local.match(/^[a-z0-9]+$/i);
  let validDomain = /^([a-z]+\.)+[a-z]+$/i.test(domain);

  console.log(validLocal && validDomain);
}

isValidEmail('Foo@baz.com.ph');          // returns true
isValidEmail('Foo@mx.baz.com.ph');       // returns true
isValidEmail('foo@baz.com');             // returns true
isValidEmail('foo@baz.ph');              // returns true
isValidEmail('HELLO123@baz');            // returns false
isValidEmail('foo.bar@baz.to');          // returns false
isValidEmail('foo@baz.');                // returns false
isValidEmail('foo_bat@baz');             // returns false
isValidEmail('foo@bar.a12');             // returns false
isValidEmail('foo_bar@baz.com');         // returns false
isValidEmail('foo@bar.....com');         // returns false

// Matching Parentheses
// Write a function that takes a string as an argument and returns true if the string contains properly balanced parentheses, false otherwise. Parentheses are properly balanced only when '(' and ')' occur in matching pairs, with each pair starting with '('.

console.log('isbalanced');
function isBalanced(string){
  let openCount = 0;

  // for (let index = 0; index < string.length; index += 1) {
  //   if (string[index] === '(') {
  //     openCount += 1;
  //   } else if (string[index] === ')') {
  //     if (openCount < 1) return false;
  //     openCount -= 1;
  //   }
  // }

  let isCountPositive = true;

  [...string].forEach(char => {
    if (char === '(') {
      openCount += 1;
    } else if (char === ')') {
      if (openCount < 1) isCountPositive = false;
      openCount -= 1;
    }
  });

  return isCountPositive && openCount === 0;

}


console.log(isBalanced('What (is) this?'));        // true
console.log(isBalanced('What is) this?'));         // false
console.log(isBalanced('What (is this?'));         // false
console.log(isBalanced('((What) (is this))?'));    // true
console.log(isBalanced('((What)) (is this))?'));   // false
console.log(isBalanced('Hey!'));                   // true
console.log(isBalanced(')Hey!('));                 // false
console.log(isBalanced('What ((is))) up('));       // false

// Further Exploration
// Can you refactor the current solution to work with the forEach method? Why does our current solution work with a for loop, but not with forEach? 

// Because a return statement from a forEach loop will simply return and exit from the callback function, not the isBalanced function as a whole. We could make it work by declaring a boolean variable that is set to false when our parentheses count dips into the negative.