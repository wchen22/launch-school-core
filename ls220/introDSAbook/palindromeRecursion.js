let p = console.log;

function isPalindrome(string) {
  // if it's the base case of single char or empty string return true
  if (string.length === 1 || string === '') return true;
  if (string[0] !== string[string.length -1]) return false;
  return isPalindrome(string.slice(1, -1));
  // 
}

p(isPalindrome('asdfdsa')) // true
p(isPalindrome('abc')) // false
p(isPalindrome('a')) // true
p(isPalindrome('')) // true