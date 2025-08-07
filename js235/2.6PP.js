//Create a function called flakyService that simulates a service that sometimes fails. The function should return a promise that resolves with "Operation successful" or rejects with "Operation failed" randomly. Use .then() for a successful operation log and .catch() for logging a failed operation.

// function flakyService() {
//   return new Promise((resolve, reject) => {
//     if (Math.random() < 0.5) {
//       resolve("Success")
//     } else reject("Failed")
//   });
// }

// let promise = flakyService();
// promise.then(console.log).catch(error => {
//   console.log(error);
// })


// Imagine a situation where you must clean up resources (e.g., close a file) whether an operation succeeds or fails. Create a promise that resolves with "Operation complete" and demonstrate how to perform cleanup after the operation completes using .finally().

// new Promise((resolve) => {
//   resolve("Operation complete");
// }).finally(() => {
//   console.log('clean up');
// })

// Practice chaining promises by creating a chain of four promises. The first promise should resolve with a number; then, the chain should double the number and add 5 in successive .then() calls. Log the result after the final operation.


function doubleAdd5(number) {
  return number * 2 + 5;
}

Promise.resolve(2).then((result) => {
  return result * 2 + 5; // 9
}).then(doubleAdd5) // 23
  .then(doubleAdd5) // 51
  .then(doubleAdd5) // 107
  .then(doubleAdd5) // 219
  .then(console.log);


// Suppose you are fetching user data from an API. Handle the error thrown by this fetchUserData function, catch it, and log only the error message. Then, use .finally() to log "Fetching complete".

// function fetchUserData() {
//   return new Promise((resolve, reject) => {
//     setTimeout(() => reject({ error: "User not found" }), 500);
//   });
// }

// fetchUserData().catch((error) => {
//   console.log(error.error);
// }).finally(() => {
//   console.log("Fetching complete")
// })

// Implement a function retryOperation that attempts to perform an operation by calling a provided function, operationFunc. If operationFunc throws an error, retryOperation should retry the operation up to two additional times before giving up and logging "Operation failed".

// function retryOperation(operationFunc) {
//   let attempts = 0;

//   function attempt() {
//     return operationFunc().then((result) => {
//       console.log(result)
//     })
//     .catch(error => {
//       if (attempts < 2) {
//         attempts += 1;
//         console.log(`Retry attempt ${attempts}`)
//         return attempt();
//       } else {
//         throw error;
//       }
//     })
//   }

//   return attempt().catch(error => console.log("operation failed"))
// }

// // Example usage:
// retryOperation(
//   () =>
//     new Promise((resolve, reject) =>
//       Math.random() > 0.9
//         ? resolve("Success!")
//         : reject(new Error("Fail!"))
//     )
// );

// Imagine an async operation represented by mockAsyncOp that can either resolve or reject. You want to ensure that no matter the outcome, you log "Operation attempted" after the operation has been completed.

// function mockAsyncOp() {
//   return new Promise((resolve, reject) => {
//     setTimeout(() => {
//       if (Math.random() > 0.5) {
//         resolve("Operation succeeded");
//       } else {
//         reject("Operation failed");
//       }
//     }, 1000);
//   });
// }

// mockAsyncOp().catch(console.error).finally(() => console.log('Attempted'));


// Implement a loadData function that fetches data but sometimes fails. It should return a promise that either fulfills with "Data loaded" or rejects with "Network error". Use a .catch() block to return a recovery promise that resolves with "Using cached data" in case of failure.

// function fetchData() {
//   return Math.random() < 0.5;
// }

// function loadData() {
//   return new Promise((resolve, reject) => {
//     if (fetchData()) {
//       resolve("data loaded")
//     } else reject('network error')
//   })
// }

// let result = loadData().catch((error) => {
//   console.log('Error occurred, recovering')
//   return Promise.resolve("Using cached data")
// })

// result.then(console.log)

function loadData() {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      if (Math.random() > 0.5) {
        resolve("Data loaded");
      } else {
        reject("Network error");
      }
    }, 1000);
  }).catch(() => {
    console.error("An error occurred. Attempting to recover...");
    // Return a recovery promise
    return Promise.resolve("Using cached data");
  }).then(console.log);
}

loadData()
// Logs "Data loaded" or "Using cached data"