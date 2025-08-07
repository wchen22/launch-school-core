class Student {
  #name;
  #track;

  constructor(firstName, lastName, track) {
    this.#name = [firstName, lastName];
    this.#track = track;
  }
}

let student = new Student('Kay', 'Oakley', 'JavaScript');
console.log(`${student.#name.join(' ')} ${student.#track}`);
// SyntaxError: Private field '#name' must be declared in an
// enclosing class