// Product of Sums
// The productOfSums function shown below is expected to return the product of the sums of two arrays of numbers. Read through the following code. Will it produce the expected result? Why or why not?

function productOfSums(array1, array2) {
  let result = total(array1) * total(array2);
  return result;
}

function total(numbers) {
  let sum = 0;

  for (let i = 0; i < numbers.length; i += 1) {
    sum += numbers[i];
  }

  return sum;
}

console.log(productOfSums([1,2], [3,5]));

// no, let sum will initialize sum to undefined during execution - line 13 is same as sum = undefined + numbers[i], which will result in NaN.

// also need an explicit return statement for total