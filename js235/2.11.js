// Convert the downloadFilePromise function you saw previously to an asynchronous function named asyncDownloadFile. Utilize await to pause execution until the file download completes before logging the success message.
 
async function asyncDownloadFile() {
  console.log("Downloading file...");
  const message = await new Promise((resolve) => {
    setTimeout(() => {
      resolve("Download complete!");
    }, 1500)
  });
  console.log(message);
}

// asyncDownloadFile();


//Create a processNTimes function that takes an array of numbers, a callback, and a number, n, as an argument. The function should utilize the processDataPromise function we wrote before and apply it to the input array of numbers n times. Here's an example:

function processDataPromise(numbers, callback) {
  return new Promise((resolve) => {
    setTimeout(() => {
      const processed = numbers.map(callback);
      resolve(processed);
    }, 1000);
  });
}

async function processNTimes(array, callback, n) {
  for (let num = 1; num <= n; num += 1) {
    array = await (processDataPromise(array, callback));
  }
  console.log(array);
}

// Example usage:
const squareIt = (n) => n * n;
// processNTimes([1, 2, 3], squareIt, 3);
// After 3 seconds, logs: [1, 256, 6561]


// Write a getReady function that utilizes at least three asynchronous functions that you write to simulate getting ready in the morning. Each task should take time and not begin until the task before has been completed. getReady should utilize async / await.

// Here's an example of how your getReady function may behave:

function wakeUp() {
  return new Promise((resolve) => {
    console.log('Alarm goes off!');
    setTimeout(() => {
      console.log("I'm up, good morning.")
      resolve();
    }, 2000);
  });
}

async function makeCoffee() {
  await new Promise(resolve => {
    console.log('Brewing...')
    setTimeout(() => {
      console.log('Coffee done!')
      resolve();
    }, 6000)
  })
}

function brushTeeth() {
  return new Promise((resolve) => {
    console.log('Brushing teeth!')
    setTimeout(resolve, 3000);
  });
}

function getDressed() {
  console.log('Getting dressed')
  return new Promise(resolve => {
    setTimeout(() => {
      resolve();
    }, 2000);
  })
}

async function getReady() {
  await wakeUp();
  makeCoffee();

  await brushTeeth();
  await getDressed();
  console.log('done')
}

getReady();
// Good morning!
// Petting cat...
// Getting dressed... (5 seconds later)
// Brushing teeth...  (3 seconds later)
// I'm ready!         (2 seconds later)


