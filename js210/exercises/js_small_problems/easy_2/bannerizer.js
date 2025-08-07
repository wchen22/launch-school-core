// Write a function that will take a short line of text, and write it to the console log within a box.

function logInBox(text) {

const innerWidth = text.length + 2;
const borderLine = '+' + ('-').repeat(innerWidth) + '+';
const paddingLine = '|' + (' ').repeat(innerWidth) + '|';
const textLine = '| ' + text + ' |';
const box = [borderLine, paddingLine, textLine, paddingLine, borderLine];

box.forEach(line => console.log(line));
}

// Examples:

logInBox('To boldly go where no one has gone before.');
// will log on the console:

// +--------------------------------------------+
// |                                            |
// | To boldly go where no one has gone before. |
// |                                            |
// +--------------------------------------------+
logInBox('');
// +--+
// |  |
// |  |
// |  |
// +--+
// You may assume that the output will always fit in your browser window.
