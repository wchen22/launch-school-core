// function delayLog() {
//   let start = 10;
//   function recursiveDelay(val) {
//     if (val === 0) return;
//     setTimeout(() => console.log(val), val * 1000);
//     recursiveDelay(val-1);
//   }

//   recursiveDelay(start);
// }

function logWithDelay(num) {
  setTimeout(() => {console.log(num)}, num * 1000);
}

function delayLog() {
  for (let num = 1; num <= 10; num += 1) {
    logWithDelay(num);
  }
}

delayLog();


function afterNSeconds(callback, seconds) {
  setTimeout(callback, seconds * 1000);
}