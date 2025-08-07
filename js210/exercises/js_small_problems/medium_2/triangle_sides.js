// Triangle Sides
// A triangle is classified as follows:

// Equilateral: All three sides are of equal length.
// Isosceles: Two sides are of equal length, while the third is different.
// Scalene: All three sides are of different lengths.
// To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and every side must have a length greater than 0. If either of these conditions is not satisfied, the triangle is invalid.

// Write a function that takes the lengths of the three sides of a triangle as arguments and returns one of the following four strings representing the triangle's classification: 'equilateral', 'isosceles', 'scalene', or 'invalid'.

// Examples:

function triangle(...sides) {
  if (invalid(sides)) {
    return "invalid";
  } else return getTriangleType(sides);
}

function getTriangleType(sides) {
  const uniqueSidesCount = unique(sides).length;
  if (uniqueSidesCount === 1) return "equilateral";
  if (uniqueSidesCount === 2) return "isosceles";
  return "scalene";
}

function unique(sides) {
  return sides.reduce((output, side) => {
    if (!output.includes(side)) output.push(side);
    return output
  }, []);
}

function invalid(dimensions) {
  dimensions.sort((a, b) => a - b);
  return dimensions.length !== 3 || 
         dimensions.some(side => side === 0) ||
         dimensions[0] + dimensions[1] <= dimensions[2];
}

console.log(triangle(3, 3, 3));        // "equilateral"
console.log(triangle(3, 3, 1.5));      // "isosceles"
console.log(triangle(3, 4, 5));        // "scalene"
console.log(triangle(0, 3, 3));        // "invalid"
console.log(triangle(3, 1, 1));        // "invalid"
console.log(triangle(3, 1, 3, 4));        // "invalid"