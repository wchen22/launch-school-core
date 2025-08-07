// What will each line of the following code return? Don't run the code until after you have tried to answer.

console.log((false && undefined)); // false: false is falsy
console.log((false || undefined)); //  undefined; both falsy returns last evaluated which is undefined
console.log(((false && undefined) || (false || undefined))); // undefined: (false || undefined)
console.log(((false || undefined) || (false && undefined))); // false: (undefined || false)
console.log(((false && undefined) && (false || undefined))); // false: (false && undefined) short circuits at false
console.log(((false || undefined) && (false && undefined))); // undefined, short-circuits at first expression
console.log(('a' || (false && undefined) || '')); // a, 'a' is truthy
console.log(((false && undefined) || 'a' || '')); // a, 'a' is truthy
console.log(('a' && (false || undefined) && '')); // undefined, second expression falsy
console.log(((false || undefined) && 'a' && '')); // undefined, first expression falsy