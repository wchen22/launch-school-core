// Right Triangles
// Write a function that takes a positive integer, n, as an argument and logs a right triangle whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

// Examples:

function triangle(n) {
/*
n lines, starting with 1 star on the right and increasing to 5
*/
for (let line = 1; line <= n; line += 1) {
  console.log(' '.repeat(n - line) + '*'.repeat(line));
}
}

triangle(5);

//     *
//    **
//   ***
//  ****
// *****

triangle(9);

//         *
//        **
//       ***
//      ****
//     *****
//    ******
//   *******
//  ********
// *********