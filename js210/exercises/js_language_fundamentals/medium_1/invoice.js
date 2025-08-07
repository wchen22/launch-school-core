// Invoice
// The invoiceTotal function in the code below computes the total amount for an invoice containing four "line items". How can you refactor the function so that it will work with invoices containing any number of line items?

function invoiceTotal(...amounts) {
  return amounts.reduce((total, element) => total + element, 0);
}

// working with parameter and argument options
// parameter: `...amounts`, argument `amounts` => rest operator that collects remaining arguments into an array
// parameter: none, argument: `[...arguments]` => uses the function's arguments object. Can also use Array.from(arguments)
console.log(invoiceTotal(20, 30, 40, 50));          // works as expected
console.log(invoiceTotal(20, 30, 40, 50, 40, 40));  // does not work; how can you make it work?