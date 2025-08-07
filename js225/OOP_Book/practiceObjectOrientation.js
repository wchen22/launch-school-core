function newToolLine() {
  let idStart = -1;
  return function(name, stock, price) {
    idStart += 1;
    return {
      id: idStart,
      name,
      stock,
      price,

      setPrice(price) {
        if (price < 0) {
         console.log('Invalid price!');
        } else this.price = price;
     },

    };
  };
}

let createTool = newToolLine();
let scissors = createTool('Scissors', 8, 10);
let drill = createTool('Drill', 15, 45);

drill.setPrice(30);

console.log(scissors);
console.log(drill);