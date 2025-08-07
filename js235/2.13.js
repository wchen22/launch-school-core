function flakyService() {
  return new Promise((resolve, reject) => {
    if (Math.random() > 0.5) {
      resolve("Operation successful");
    } else {
      reject("Operation failed");
    }
  });
}

// flakyService().then(console.log).catch(console.error);

// (async () => {
//   try {
//     console.log(await flakyService());
//   } catch (error) {
//     console.log(error)
//   }
// })();


// Write an async function to provide the same behavior as our promise chain in this code:

function operation() {
  return new Promise((resolve) => {
    console.log("Operation started");
    setTimeout(() => {
      resolve("Operation complete");
    }, 1000);
  });
}

// operation()
//   .then(console.log)
//   // Logs: Operation complete
//   .finally(() => {
//     console.log("Cleaning up resources...");
//     // Always logs after operation completion
//   });

async function startOperation() {
  try {
    console.log (await operation())
  } finally {
    console.log('cleaning up resources')
  }
}

startOperation();



// 7966366b3b89339c0294961f4ab12be5
