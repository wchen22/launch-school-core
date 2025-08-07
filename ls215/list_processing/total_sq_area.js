// Write a Function named totalArea that takes an Array of rectangles as an argument. The Function should return the total area covered by all the rectangles.

let rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];
// want same size array of areas
// then sum

let area = totalArea(rectangles);    // 141
console.log(area);

function totalArea(array) {
  let areas = array.map(dimensions => dimensions[0] * dimensions[1]);
  return areas.reduce((total, area) => total + area);
};


// Now, write a second Function named totalSquareArea. This Function should calculate the total area of a set of rectangles, just like totalArea. However, it should only include squares in its calculations: it should ignore rectangles that aren't square.

rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];

function totalSquareArea(rectangles) {
  let squares = rectangles.filter(dimensions => dimensions[0] === dimensions[1]);
  return totalArea(squares);
};

console.log(totalSquareArea(rectangles));    // 121