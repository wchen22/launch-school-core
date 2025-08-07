// Read through the following code. Why will it log 'debugging'?

function debugIt() {
  const status = 'debugging';
  function logger() {
    console.log(status);
  }

  logger();
}

debugIt();

// during creation, all function declarations are 'hoisted' to the top of their scope. (I think technically, whenever a function is invoked, it creates an execution context and looks for function and variable declarations to add to the namespace before executing any code.)

// When debutIt() is invoked, we move into the execution context for that function. logger() is 'hoisted', which means it is available within the entire scope of debugIt(). status is also hoisted. During execution, status is now moved from TDZ and assigned to 'debugging'. logger() invocation on line 9 calls logger() and logs 'debugging'. Even though const creates block scope, in the absence of a block it takes on the scope of the function it is declared in.

// To keep it simple: it logs 'debugging' due to JS's lexical scoping rules. Functions have access to variables in their enclosing scope.