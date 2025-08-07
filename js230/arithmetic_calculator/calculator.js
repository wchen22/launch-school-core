// listener on = sign
  // stopdefault
  // get operator
  // get input1 and input2
  // answer = calculate (input1, operator, input2)
  // update answer element through DOM

function calculate(num1, num2, operator) {
  const operations = {
    '+': () => num1 + num2,
    '-': () => num1 - num2,
    '/': () => num1 / num2,
    '*': () => num1 * num2,
  }

  return operations[operator]();
};

document.addEventListener('DOMContentLoaded', () => {
  let button = document.querySelector('input[type=submit]');
  button.addEventListener('click', event => {
    event.preventDefault();
    let result = document.getElementById('result');
    let num1 = Number(document.getElementById('first-number').value);
    let num2 = Number(document.getElementById('second-number').value);
    let operator = document.getElementById('operator').value;

    let answer = calculate(num1, num2, operator);
    result.textContent = answer;
  });
});