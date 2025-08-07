// Length
// Read through the code below. What values will be logged to the console? Can you explain these results?

const languages = ['JavaScript', 'Ruby', 'Python'];
console.log(languages); //  [ 'JavaScript', 'Ruby', 'Python' ]
console.log(languages.length); // 3

languages.length = 4; 
console.log(languages); // [ 'JavaScript', 'Ruby', 'Python', 1 empty item ]
console.log(languages.length); // 4; line 8 accesses the length property and changes it even though there is no element at the new index. 

languages.length = 1; 
console.log(languages); // [ 'JavaScript' ] Array gets sized down to 1, elements not preserved
console.log(languages.length); // 1

languages.length = 3;
console.log(languages); // [ 'JavaScript', 2 empty items ]
console.log(languages.length); // 3; length again modified, 2 empty item placeholders. Doesn't restore truncated elements

languages.length = 1;
languages[2] = 'Python';
console.log(languages); // [ 'JavaScript', 1 empty item, 'Python' ] length is calculated as highest index + 1. Empty indices noted as having an empty item
console.log(languages[1]); // undefined; attempting to retrieve will return undefined, although there is not actually any element with the value undefined
console.log(languages.length); // 3; same as line 22
