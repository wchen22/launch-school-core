"use strict"

let object = {
  foo() {
    return 'this here is: ' + this;
  },
};

console.log(object.foo());              // "this here is: [object Object]"

let bar = object.foo;
console.log(bar());     // "this here is: [object Window]" [object undefined] if use strict