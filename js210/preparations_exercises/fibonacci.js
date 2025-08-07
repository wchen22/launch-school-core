// function fibonacci(nth_number){
//   if (nth_number === 0) return 0;
//   if (nth_number === 1) return 1;
//   return fibonacci(nth_number-1) + fibonacci(nth_number-2);

  
// }

function fibonacci(n){
  if (n === 0 || n === 1) return n;
  return fibonacci(n-1) + fibonacci(n-2);
}



console.log(fibonacci(0)); //0
console.log(fibonacci(1)); //1
console.log(fibonacci(2)); //1
console.log(fibonacci(3)); //2
console.log(fibonacci(4)); // 3
console.log(fibonacci(5)); // 5
console.log(fibonacci(6)); // 8
console.log(fibonacci(7)); // 13