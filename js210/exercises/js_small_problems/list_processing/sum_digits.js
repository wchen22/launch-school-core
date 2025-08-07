function sum(number) {
  return String(number).split('').reduce((sum, digit) => sum + Number(digit), 0);
}

sum(23);           // 5
console.log("🚀 ~ sum(23):", sum(23))
sum(496);          // 19
console.log("🚀 ~ sum(496):", sum(496))
sum(123456789);    // 45
console.log("🚀 ~ sum(123456789):", sum(123456789))
