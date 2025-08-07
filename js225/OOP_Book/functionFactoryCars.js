function makeCar(accelerationRate, brakeRate) {
  return {
    speed: 0,
    accelerationRate,
    brakeRate,

    accelerate() {
      this.speed += this.accelerationRate;
    },

    brake(){
      this.speed -= this.brakeRate;
      if (this.speed < 0) this.speed = 0;
    }
  }
}

let sedan = makeCar(8,6);
console.log(sedan);
sedan.accelerate();
sedan.accelerate();
sedan.brake();
console.log(sedan);

let hatchback = makeCar(9);

function makeVehicle(fuel, mpg) {
  return {
    fuel,
    mpg,
    range() {
      console.log(this.fuel * this.mpg);
    },
  };
}

let smallCar = makeVehicle(7.9, 37);
smallCar.range();   // 292.3

let largeCar = makeVehicle(9.4, 29);
largeCar.range();   // 272.6

let truck = makeVehicle(14.4, 23);
truck.range = function() {
  console.log('new function!')
}
truck.range();      // 'new function!'
largeCar.range();   // 272.6
