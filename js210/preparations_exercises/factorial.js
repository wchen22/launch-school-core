function factorial(n){
  // let factorial = 1;
  // for (; n >= 1; n--){
  //   factorial *= n;
  // }
  // return factorial;
  if (n === 1) return n;
  return n * factorial(n-1);
}

console.log(factorial(8));