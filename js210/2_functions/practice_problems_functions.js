function average(values){
   return sum(values) / values.length;
}

function sum(values){
  let total = 0;
  for (let i = 0; i < values.length; i += 1){
    total += values[i];
  }
  return total
}

console.log(average([10, 15, 50]));

let temperatures = [35, 47, 55, 27, 38];

console.log(average(temperatures));

