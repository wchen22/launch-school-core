let a = 1;
let foo;
let obj;

console.log(global.a)

function Foo() {
  this.a = 2;
  this.bar = function() {
    console.log(this.a);
  };
  this.bar();
}

foo = new Foo(); // constructs new object, sets its own property a to 2 and logs it 2

foo.bar(); // logs 2
Foo(); // sets global property a to 2, logs it with global context 2

obj = {};
Foo.call(obj); // obj gets a property, sets to 2 and logs i2
obj.bar(); // log obj's a property, logs 2

console.log(this.a); // will log 2