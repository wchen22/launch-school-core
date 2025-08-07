// Use the OLOO pattern to create an object prototype that we can use to create pet objects. The prototype should let us create and use pets like this:

let PetPrototype = {
  sleep() {
    console.log(this.name + ' is sleeping');
  },

  wake() {
    console.log('I am awake');
  },

  init(animal, name) {
    this.animal = animal;
    this.name = name;
    return this;
  }
}

let pudding = Object.create(PetPrototype).init("Cat", "Pudding");
console.log(`I am a ${pudding.animal}. My name is ${pudding.name}.`);
pudding.sleep(); // I am sleeping
pudding.wake();  // I am awake

let neptune = Object.create(PetPrototype).init("Fish", "Neptune");
console.log(`I am a ${neptune.animal}. My name is ${neptune.name}.`);
neptune.sleep(); // I am sleeping
neptune.wake();  // I am awake

// Convert your code from the previous exercise to use the pseudo-classical object creation pattern using a Pet constructor.

function Pet(animal, name) {
  this.animal = animal;
  this.name = name;
}

Pet.prototype.sleep = PetPrototype.sleep;
Pet.prototype.wake = PetPrototype.wake;

let rufus = new Pet("Dog", "Rufus");
console.log(`I am a ${rufus.animal}. My name is ${rufus.name}.`);
rufus.sleep();
rufus.wake();

