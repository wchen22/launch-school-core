// let myPromise = new Promise((a) => {
//   setTimeout(() => {
//     a("hello");
//   }, 1000)
// });

// myPromise.then((result) => {
//   console.log(`Got a result: ${result}`);
// });

// console.log('Finished setting up!');

// function washLaundry() {  // We no longer need a callback argument
//   console.log("Putting clothes in wash.");
//   console.log("Adding soap.");

//   console.log("Washing laundry...");
//   return new Promise((resolve) => {
//     setTimeout(() => {
//       console.log("Buzz!");
//       resolve();
//     }, 5000)
//   })
// }


// function bakeCookies() {
//   return new Promise((resolve) => {
//     console.log("Mixing ingredients.");
//     console.log("Scooping cookie dough.");
//     console.log("Putting cookies in oven.");
    
//     console.log("Baking...");
//     setTimeout(() => {
//       console.log("Beep!");
//       resolve();
//     }, 3000)
//   })
// }

// bakeCookies().then(() => {
//   console.log("Cooling cookies.");     
//   console.log("Eating cookies.");
// })

// washLaundry();

// // THIS IS WRONG
// let data = 'example@email.com';

// new Promise(function (resolve) {
//   console.log("Checking if email exists...");
//   setTimeout(() => resolve(data), 2000);
// })
//   .then((data) => {
//     console.log("Storing user details...");
//     setTimeout(() => {
//       return data;
//     }, 1000)
//   })
//   .then((data) => {
//     console.log('Sending verification email...');
//     setTimeout(() => {
//       console.log('asdf')
//       return;
//     }, 1000)
//   })
//   .then((data) => {
//     console.log("User signup process completed!");
//   })


let myPromise = new Promise((resolve, reject) => { // Add `reject` parameter
  setTimeout(() => {
    console.log('Running!')
    if (Math.random() < 0.5) {
      resolve('great success');
    } else {
      reject(new Error("Something went wrong."));  // reject instead of resolve
    }
  }, 1000)
});

// myPromise.then((result) => {
//   console.log(`Success message: ${result}`);
// })

myPromise.catch((errorMessage) => {
  console.log(`Error message: ${errorMessage}`);
})