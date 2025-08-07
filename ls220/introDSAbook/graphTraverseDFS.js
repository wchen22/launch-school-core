// Implement a function `dfs` that accepts two arguments: the adjacency list
// representing a directed acyclic graph and a starting vertex (source).
// The function should print the vertices in preorder depth-first
// traversal order.

// Recursive solution
function dfs(adjList, source) {
  // implementation goes here
  // Node, then vertices.
  // Stack solution makes a lot of sense - how to do that in recursion? What's the base case if we aren't relying on a stack?
    // if the current node has no next neighbors, then return
    // what to do with multiple neighbors? how do we go to a next path after we unwind/reach end of one?
    // trying to remember how this happened with binary dfs
      // we did left traverse and right traverse during the while loop
      // instead, we can use a for loop over the array
      // so if array for that node is empty, return
      // otherwise, for each node in current adjacent array, call traverse
  const output = [];
  const traverse = function(vertex) {
    output.push(vertex);
    if (adjList.get(vertex).length === 0) return;
    adjList.get(vertex).forEach(neighbor => {
      traverse(neighbor);
    })
  }
  traverse(source);
  console.log(output);
}

function dfs(adjList, source) {
  console.log(source);
  let neighbors = adjList.get(source);
  for (let neighbor of neighbors) {
    dfs(adjList, neighbor);
  }
}

const adjList = new Map();
adjList.set(1, []);
adjList.set(2, [1, 3, 4]);
adjList.set(3, [5]);
adjList.set(4, [6]);
adjList.set(5, []);
adjList.set(6, []);
adjList.set(7, [6]);

dfs(adjList, 2); // 2, 4, 6, 3, 5, 1 or 2, 1, 3, 5, 4, 6

// Note that the output can vary based on the order in
// which you process neighbors. These two outputs are
// the most likely, but other valid orders exist.