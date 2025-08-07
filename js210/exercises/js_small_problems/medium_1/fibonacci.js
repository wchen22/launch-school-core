// Fibonacci recursion

/*
Recursive functions:
-Run at least once
-Have an ending condition
-Use the result of a recursive invocation in each step
*/

function fibonacci(n) {
  let second;
  if (n > 2) {
    second = fibonacci(n-2) + fibonacci(n-1);  
  } else second = 1;

  return second;
}



console.log(fibonacci(20));

function fibProcedural(n) {
  if (n <= 2) return 1;
  let [first, second] = [1, 1];
  let counter = 2;

  do {
    [first, second] = [second, first + second];
    counter += 1;
  } while (counter < n);

  return second;
}

console.log(fibProcedural(30));       // 2111485077978050

const memo = {}
function fibMemoization(n) {
  let second;
  if (n > 2) {
    second = (memo[n-2] || fibMemoization(n-2)) + fibMemoization(n-1);  
  } else second = 1;

  memo[n] = second;
  console.log(memo);
  return second;
}

console.log(fibMemoization(75));
