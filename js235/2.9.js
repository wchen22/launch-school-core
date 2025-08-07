function flakyService() {
  return new Promise((resolve, reject) => {
    if (Math.random() > 0.9) {
      resolve("Operation successful");
    } else {
      reject("Operation failed");
    }
  });
}

function loadData() {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      if (Math.random() > 0.5) {
        resolve("Data loaded");
      } else {
        reject("Network error");
      }
    }, 1000);
  });
}

// Use Promise.all() to execute two instances of the flakyService function and one of the loadData function concurrently. Log the results if all the operations are successful. Handle the situation where one or more of the promises might fail by logging "One or more operations failed".

// Promise.all([flakyService(), flakyService(), loadData()]).then(console.log).catch(() => console.log("One or more operations failed"));


// Imagine you have two promises, firstResource and secondResource, that resolve after different intervals. Use Promise.race() to log the value of whichever promise resolves first.

const firstResource = new Promise((resolve) =>
  setTimeout(() => resolve("First resource loaded"), 500)
);
const secondResource = new Promise((resolve) =>
  setTimeout(() => resolve("Second resource loaded"), 1000)
);

// Promise.race([firstResource, secondResource]).then(console.log);

// You have multiple instances of flakyService promises. Implement a strategy using Promise.allSettled() to execute all services but log all the different outcomes, whether fulfilled or rejected.

// const services = [flakyService(), flakyService(), flakyService()];

// Promise.allSettled(services).then(console.log);

// Once again, you have multiple instances of flakyService promises. Implement a strategy using Promise.any() to execute all services and return the result of the first service that succeeds. If all services fail, log an error message.

// Promise.any(services)
//   .then(console.log)
//   .catch((error) => console.log("No service succeeded:", error));


// Implement a function timeoutPromise(promise, ms) that takes a promise and a timeout duration in milliseconds. If the promise resolves before the timeout, return its result. Otherwise, reject with the message "Operation timed out".

// You can use the loadData function, which takes one second to resolve or reject, to test out your method.

// Example usage:

function timeoutPromise(promise, milliseconds) {
  const timeout = new Promise((resolve, reject) => {
    setTimeout(() => {
      reject("Operation timed out");
    }, milliseconds);
  });

  return Promise.race([promise, timeout])
  // race the promise against a promise wrapped around settimeout(milliseoncds)
  // if it returns the settimeout, then reject "Operation timed out"
    // otherwise resolve with promise's value

}

timeoutPromise(loadData(), 500)
  .then(console.log)
  .catch(console.error);
// Expected output: "Operation timed out" (because it exceeds 500ms)

timeoutPromise(loadData(), 2000)
  .then(console.log)
  .catch(console.error);
// Expected output: result from load data 