// Using the constructor/prototype pattern, create a type that represents smartphones. Each smartphone should have a brand, model, and release year. Add methods that display the smartphone's information and check its battery level. Create objects that represent the following two smartphones:

// Brand	Model	Release Year
// Apple	iPhone 12	2020
// Samsung	Galaxy S21	2021

function Smartphone(brand, model, releaseYear) {
  this.brand = brand;
  this.model = model;
  if (releaseYear !== undefined) {
    this.releaseYear = releaseYear;
  }}

Smartphone.prototype = {
  displayInfo() {
    console.log(`This is a ${this.releaseYear} ${this.brand} ${this.model}`);
  },

  checkBattery() {
    console.log('Battery at 50%')
  }
};

// let phone1 = new Smartphone('Apple', 'iphone 12', 2020);
// console.log(Object.getPrototypeOf(phone1))

// Smartphone.prototype.something = 20;

// console.log(phone1.something);

// Smartphone.prototype.releaseYear = 1990;

// console.log(phone1.brand);

// let phone2 = new Smartphone('S21', 2010)
// console.log(phone2)
// console.log(phone2.releaseYear);
// console.log(Object.getPrototypeOf(phone2))


// phone1.displayInfo();
// phone1.checkBattery();


// This exercise re-examines exercise 3 from the previous chapter. In that exercise, you wrote a class hierarchy to represent vehicles of various types. In this exercise, we'll rewrite that solution using the constructor/prototype pattern.

// Using the constructor/prototype pattern, create some types that represent vehicles, including cars, boats, and planes as specific kinds of vehicles. All vehicles should be able to accelerate and decelerate. Cars should be able to honk, boats should be able to drop anchor, and planes should be able to take off and land. Test your code.

function Vehicle(make) {
  this.make = make;
}

Vehicle.prototype.accelerate = function() {
  console.log('Speeding up');
}

Vehicle.prototype.decelerate = function() {
  console.log('Slowing down');
}

let vehicle = new Vehicle();
vehicle.accelerate();

function Car(make) {
  Vehicle.call(this, make);
}

Car.prototype = Object.create(Vehicle.prototype); // To mimic inheritance, return a new object whose prototype is the Vehicle constructor's prototype, and set this object to Car.prototype. This effectively creates a prototype chain.
Car.prototype.constructor = Car;
Car.prototype.honk = function() {
  console.log('honk');
}

let car = new Car('Toyota');

car.decelerate();
console.log(car.make);
car.honk();