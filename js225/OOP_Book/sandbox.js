function Cat(name) {
  this.name = name;

  this.purr = function() {
    console.log('purr');
  }

  this.speak = function() {
    console.log('meow!');
  }
}

let butterscotch = new Cat("Butterscotch"); // calling the Cat function with the new keyword makes the call a constructor call, with `Cat` serving as a constructor function
butterscotch.purr();
butterscotch.speak();


let pudding = new Cat("Pudding");

function Dog(breed) {

}

let rufus = new Dog("breed");

let student = {
  name: 'Joanna',
  age: 27,

  study: function() {
    console.log(`${this.name} is studying`);
  },

  pass: function() {
    console.log(`${student.name} has passed this course`)
  },
};

student.study();  // Joanna is studying
student.pass();   // Joanna has passed this course

let cessna = {
  fuelCapacity: 24.5,
  cruisingSpeed: 111,

  takeOff() {
    console.log('taking off!');
  },

  land() {
    console.log('landing');
  }
};

console.log(cessna.fuelCapacity);
cessna.takeOff();
cessna.land();

function Book(title, author, year) {
  this.title = title;
  this.author = author;
  this.year = year;
}

let neuromancer = new Book('Neuromancer', 'William Gibson', 1984);
let doomsday = new Book();

doomsday.title = 'Doomsday Book';
doomsday.author = 'Connie Willis';
doomsday.year = 1992;

console.log(neuromancer.year);
console.log(doomsday);

function Album(title, artist, releaseYear) {
  this.title = title;
  this.artist = artist;
  this.releaseYear = releaseYear;
}

function Smartphone(brand, model, releaseYear) {
  this.brand = brand;
  this.model = model;
  this.releaseYear = releaseYear;

  this.checkBatteryLevel = function () {
    console.log('battery has juice');
  }

  this.displayInfo = function () {
    console.log(`This is a ${this.releaseYear} ${this.brand} ${this.model}`)
  }
}

let iphone = new Smartphone('Apple', 'iPhone12', 2020);

iphone.displayInfo();

// That's a significant improvement over our original for loop, but we can go even further. For example, let's package our collection and functions together:

// create an object named people,
// create a collection property for all our person objects,
// create a rollCall method, and
// create a fullName method.

let wilson = {
  firstName: 'Wilson',
  lastName: 'Chen',
}

let johnny = {
  firstName: 'Johnny',
  lastName: 'Bravo',
}

let people = {
  collection: [johnny, wilson],
  
  rollCall() {
    this.collection.forEach(this.fullName)
  },

  fullName(person) {
    console.log(person.firstName + ' ' + person.lastName);
  },

  add(person) {
    this.collection.push(person);
  }, 
};

people.rollCall();