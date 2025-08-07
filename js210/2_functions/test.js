console.log(foo);

function foo() {
  console.log(bar);
  console.log(asf);
}

let bar = 'asdf';

function baz() {
  asf = 'global from function'
}

baz();
foo();

// partial function application
// more generalized function we can use as basis for more specific functions by creating a second function that fixes one or more of the parameters when called, deferring the remaining parameters to be assigned later on
// or, creating a second function that requires only some of the parameters of the original function, which returns the another function which takes the remaining arguments and calls the original function when invoked

function introduce_player(name, accolade, position) {
  console.log(`Welcoming your ${accolade} ${position}, ${name}!`)
}

introduce_player('Damian Lillard', 'All-Star', 'Point Guard');

function introduce_accolade(accolade){
  return function (name, position) {
    introduce_player(name, accolade, position);
  }
}

let introAllStar = introduce_accolade('2025 All Star');
introAllStar('Paul George', 'Small Forward');