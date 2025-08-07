// Stack Machine Interpretation
// A stack is a list of values that grows and shrinks dynamically. A stack may be implemented as an Array that uses two Array methods: Array.prototype.push and Array.prototype.pop.

// A stack-and-register programming language is a language that uses a stack of values. Each operation in the language operates on a register, which can be thought of as the current value. The register is not part of the stack. An operation that requires two values pops the topmost item from the stack (i.e., the operation removes the most recently pushed value from the stack), operates on the popped value and the register value, and stores the result back in the register.

// Consider a MULT operation in a stack-and-register language. It removes the value from the stack, multiplies the removed stack value with the register value, then stores the result back in the register. For example, if we start with a stack of [3, 6, 4] (where 4 is the topmost item in the stack) and a register value of 7, the MULT operation mutates the stack to [3, 6] (the 4 is removed), and the result of the multiplication, 28, is left in the register. If we do another MULT at this point, the stack is mutated to [3], and the register is left with the value 168.

// Write a function that implements a miniature stack-and-register-based programming language that has the following commands (also called operations or tokens):

// n : Place a value, n, in the register. Do not modify the stack.
// PUSH : Push the register value onto the stack. Leave the value in the register.
// ADD : Pop a value from the stack and add it to the register value, storing the result in the register.
// SUB : Pop a value from the stack and subtract it from the register value, storing the result in the register.
// MULT : Pop a value from the stack and multiply it by the register value, storing the result in the register.
// DIV : Pop a value from the stack and divide the register value by the popped stack value, storing the integer result back in the register.
// REMAINDER : Pop a value from the stack and divide the register value by the popped stack value, storing the integer remainder of the division back in the register.
// POP : Remove the topmost item from the stack and place it in the register.
// PRINT : Print the register value.
// All operations are integer operations (which is only important with DIV and REMAINDER).

// Programs will be supplied to your language function via a string argument. Your function may assume that all arguments are valid programs — i.e., they will not do anything like trying to pop a non-existent value from the stack, and they will not contain any unknown tokens.

// Initialize the stack and register to the values [] and 0, respectively.


/* 
PROBLEM:
- Implement a stack and register, and given a program command that contains operations/tokens, parse and execute these operations.

Input: String with valid operations/tokens
? Are commands always one-space delimited? => Yes

Output: Register value is printed on PRINT commands, otherwise no output

Rules:
  Operation types:
  - n : Place a value in register
  - Mutates stack:
    - POP/PUSH: popping changes register value
    - ADD SUB MULT DIV REMAINDER : Integer operations
  - PRINT: Display register value

Data Structure and Algorithm
- Stack and register initialized to [] and 0. 
- Initialize calculations to [ADD SUB MULT DIV REMAINDER]
- Create functions for each command
  - 'n' command: reassign register to argument
  - pop: pop a value from stack array, reassign register to that value
  - push: push current register value onto stack array
  - calculate(command) 
    - pop a value from stack array, 
    - Determine which command is received, and perform add/sub/mult/div/remainder operation using popped value and register
    - reassign register to the result
  - print: log register value to the console
- Parse the commands into an array
  - Split on ' '
- Iterate over the commands array
  - Determine the command it is
    - 'n' commands: If !isNaN(Number(command))
    - calculate: If it's in calculations array
      - call calculate(command)
    - case statement for other commands
    - Call the command

*/

function minilang(command) {
  const STACK_COMMANDS = ['ADD', 'SUB', 'MULT', 'DIV', 'REMAINDER', 'POP'];
  const stack = [];
  let register = 0;
  const operations = {
    ADD: () => register = register + stack.pop(),
    SUB: () => register = register - stack.pop(),
    MULT: () => register = register * stack.pop(),
    DIV: () => register = parseInt(register / stack.pop(), 10),
    REMAINDER: () => register = register % stack.pop(),
    PUSH: () => stack.push(register),
    POP: () => register = stack.pop(),
    PRINT: () => console.log(register)
  }

  let commands = command.split(' ');

  for (let index = 0; index < commands.length; index += 1) {
    let command = commands[index];
    if (stack.length === 0 && STACK_COMMANDS.includes(command)) {
      return console.log(`Error: cannot perform ${command} with empty stack`);
    } else if (operations[command]) {
      operations[command]();
    } else if (!isNaN(Number(command))) {
      register = Number(command);
    } else {
      return console.log(`Error: invalid command '${command}'`);
    }
  }
}
// Examples:

// Error handling
minilang('POP PRINT') // Error: stack is empty!

minilang('JUMP') // Error: invalid command

minilang(''); // nothing is printed

minilang('PRINT');
// 0

minilang('5 PUSH 3 MULT PRINT');
// 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT');
// 5
// 3
// 8

minilang('5 PUSH POP PRINT');
// 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT');
// 5
// 10
// 4
// 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT'); // [3 3] 7 ; 7/3 = 2, *3 = 6
// 6

minilang('4 PUSH PUSH 7 REMAINDER MULT PRINT'); // [4 4] 7; 3 4 12
// 12

minilang('-3 PUSH 5 SUB PRINT');
// 8

minilang('6 PUSH');
// (nothing is printed because the `program` argument has no `PRINT` commands)

minilang('1 10 PRINT'); // replace the register value without pushing it
// 10

minilang('PUSH DIV PRINT') // NaN