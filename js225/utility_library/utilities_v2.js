var _ = function(element) {
  var u = {
    last: function() {
      return element[element.length - 1];
    },

    first: function() {
      return element[0];
    },

    without: function(...values) {
      let result = [];
      for (let index = 0; index < element.length; index += 1) {
        if (!values.includes(element[index])) result.push(element[index]);
      } 
      return result;
    },

    lastIndexOf: function(value) {
      for (let index = element.length - 1; index >= 0; index -= 1) {
        if (element[index] === value) return index;
      }

      return -1;
    },

    sample: function(count = 1) {
      let randomized = [...element].sort(() => Math.random() - 0.5);
      if (count === 1) return randomized[0];
      return randomized.slice(0, count);
    },

    findWhere: function(property) {
      const matchedKeys = (key, obj) => obj[key] === property[key]
      for (let index = 0; index < element.length; index += 1) {
        if (Object.keys(property).every(key => matchedKeys(key, element[index]))) return element[index];
      }
    },

    where: function(property) {
      return element.filter(obj => {
        let key = Object.keys(property)[0];
        return obj[key] === property[key];
      });
    },

    pluck: function(key) {
      let matchingEntries = element.filter(obj => {
        return Object.keys(obj)[0] === key;
      });
      return matchingEntries.map(obj => Object.values(obj)[0]);
    },

    keys: function() {

    },

    values: function() {

    },

    extend: function() {

    },

  };

  return u;
};

_.range = function (start, end) {
  if (!end) [start, end] = [0, start];
  let output = [];
  for (let current = start; current < end; current += 1) {
    output.push(current);
  }

  return output;
}