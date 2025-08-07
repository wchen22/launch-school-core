// We have the following Array of information for some popular bands:

// let bands = [
//   { name: 'sunset rubdown', country: 'UK', active: false },
//   { name: 'women', country: 'Germany', active: false },
//   { name: 'a silver mt. zion', country: 'Spain', active: true },
// ];

// There are problems with this data, though, so we first have to clean it up before we can use it:

// The band countries are wrong: all the bands should have 'Canada' as the country.
// The band name should have all words capitalized.
// Remove all dots from the band names.
// Write a function that can process the input band Array and return an Array that contains the fixed information:

let bands = [
  { name: 'sunset rubdown', country: 'UK', active: false },
  { name: 'women', country: 'Germany', active: false },
  { name: 'a silver mt. zion', country: 'Spain', active: true },
];

function capitalize(name) {
  let words = name.split(' ');
  return words.map( word => {
    return word[0].toUpperCase() + word.slice(1);
  }).join(' ');
};

function removeDots(string) {
  return [...string].filter (letter => letter !== '.').join('');

}

function processBands(data) {
  return data.map(band => {
    return {
      name: removeDots(capitalize(band.name)),
      country: 'Canada',
      active: band.active
    };
  });
}

console.log(processBands(bands));
console.log(bands);

// should return:
// [
//   { name: 'Sunset Rubdown', country: 'Canada', active: false },
//   { name: 'Women', country: 'Canada', active: false },
//   { name: 'A Silver Mt Zion', country: 'Canada', active: true },
// ]