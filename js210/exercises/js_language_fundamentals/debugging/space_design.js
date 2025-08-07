// Space Design
// We're putting together some information about our new company Space Design. Not all roles have been filled yet. But although we have a CEO and Scrum Master, displaying them shows undefined. Why is that?

// Roles (salary still to be determined)

const ceo = {
  tasks: ['company strategy', 'resource allocation', 'performance monitoring'],
  salary: 0,
};

const developer = {
  tasks: ['turn product vision into code'],
  salary: 0,
};

const scrumMaster = {
  tasks: ['organize scrum process', 'manage scrum teams'],
  salary: 0,
};

// Team -- we're hiring!

const team = {};

team['ceo'] = 'Kim';
team['scrumMaster'] = 'Alice';
team['developer'] = undefined; // because we are using variables as keys rather than strings and our variables all reference objects, javascript will coerce them into strings. The string representation for objects is '[object Object]'. Thus, this is merely creating a property with that as a key and changing the value twice, ultimately to `undefined`. 

// When we try to reference the properties by the keys as variables, we will successfully retrieve the only key-value pair with returns undefined each time.

// To fix this, change key to string.

const company = {
  name: 'Space Design',
  team,
  projectedRevenue: 500000,
};

console.log(company);
console.log(`----{ ${company.name} }----`);
console.log(`CEO: ${company.team['ceo']}`);
console.log(`Scrum master: ${company.team['scrumMaster']}`);
console.log(`Projected revenue: $${company.projectedRevenue}`);

// ----{ Space Design }----
// CEO: undefined
// Scrum master: undefined
// Projected revenue: $500000