// Write a function basicCallback that receives a callback function and a numeric argument. This function should execute the callback after 2 seconds, passing it the number it received as an argument.

// function basicCallback(callback, number) {
//   setTimeout(() => callback(number), 2000);
// }

// // Example usage:
// basicCallback((number) => {
//   console.log(number * 2);
// }, 5);
// // After 2 seconds, logs: 10

// function downloadFile(callback) {
//   console.log('downloading file...');
//   setTimeout(() => {
//     callback('download complete!')
//   }, 1500); 
// }

// downloadFile((message) => console.log(message));

// function processData(array, callback) {
//   setTimeout(() => console.log(array.map(callback))
//   , 1000);
// }

// processData([1,2,3], (number) => number * 2);

const double = (x) => x * 2;
function waterfallOverCallbacks(array, initial) {
  array.forEach(callback => {
    initial = callback(initial)
  });

  console.log(initial);
}

waterfallOverCallbacks([double, double, double], 1);

// Consider the function startCounter that accepts a callback. It should use setInterval to call the callback every second, incrementing and logging a counter variable each time. Also, provide a way for the callback to stop the counter after reaching a specified value.

// Example usage:

function startCounter(callback) {
  let counter = 1;
  let id = setInterval(() => {
    if (callback(counter)) clearInterval(id);
    counter += 1;
  }, 1000);
}
startCounter((count) => {
  console.log(count);
  return count === 5;
});
// Logs 1, 2, 3, 4, 5, then stops