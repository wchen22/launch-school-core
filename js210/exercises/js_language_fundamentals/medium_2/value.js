// What's My Value?
// What will the following program log to the console? Can you explain why?

const array = ['Apples', 'Peaches', 'Grapes'];

array[3.4] = 'Oranges';
console.log(array.length); // 3, since length only counts properties with non-negative integer keys
console.log(Object.keys(array).length); // 4; Object.keys will create an array with all keys of which there are 4

array[-2] = 'Watermelon';
console.log(array.length); // 3 again, prior line simply added another property with '-2' as a key which doesn't qualify as a valid array index
console.log(Object.keys(array).length); // 5, same reason as line 8