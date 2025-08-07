function downloadFile(callback) {
  console.log("Downloading file...");
  setTimeout(() => {
    callback("Download complete!");
  }, 1500);
}

function downloadFilePromise() {
  return new Promise(resolve => {
    console.log("Downloading file...");
    setTimeout(() => {
      resolve("Download complete!");
    }, 1500);
  });

}

downloadFilePromise().then((result) => console.log(result));


function processData(numbers, callback) {
  setTimeout(() => {
    const processed = numbers.map(callback);
    console.log(processed);
  }, 1000);
}

// Example usage:
//processData([1, 2, 3], (number) => number * 2);
// After 1 second, logs: [2, 4, 6]


function processDataPromise(numbers, callback) {
  return new Promise((resolve) => {
    setTimeout(() => {
      const processed = numbers.map(callback);
      resolve(processed);
    }, 1000);
  });
}
// Example usage:
processDataPromise([1, 2, 3], (number) => number * 2).then((processedNumbers) => {
  console.log(processedNumbers);
  // After 1 second, logs: [2, 4, 6]
});