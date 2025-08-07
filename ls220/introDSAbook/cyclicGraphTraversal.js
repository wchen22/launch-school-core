// Implement a function `dfs` that accepts two arguments: an adjacency
// list representing an undirected graph, and a starting vertex (source).
// The function should print the vertices in preorder depth-first
// traversal order.

// recursive solution
// function dfs(adjList, source, visited = new Set()) {
//   visited.add(source);
//   console.log(source);

//   for (let neighbor of adjList.get(source)) {
//     if (!visited.has(neighbor)) {
//       dfs(adjList, neighbor, visited);
//     } 
//   }
// }   

// stack solution

function dfs(adjList, source) {
  const stack = [source];
  const visited = new Set([source]);

  while (stack.length > 0) {
    let curr = stack.pop();
    console.log(curr);
    //visited.add(curr);
    
    for (let neighbor of adjList.get(curr)) {
      if (!visited.has(neighbor)) {
        visited.add(neighbor);
        stack.push(neighbor);
      }
    }
  }
}



const adjList = new Map();
adjList.set(1, [2]);
adjList.set(2, [1, 3]);
adjList.set(3, [2]);

dfs(adjList, 1); // 1, 2, 3

const adjList2 = new Map();

adjList2.set('A', ['B', 'C']);
adjList2.set('B', ['A', 'C', 'D']);
adjList2.set('C', ['A', 'B', 'D']);
adjList2.set('D', ['B', 'C']);

dfs(adjList2, 'A'); 


// Now, try refactoring the breadth-first search solution using a visited set on your own.

// Implement a function `bfs` that accepts two arguments: the adjacency list
// representing an undirected graph and a starting vertex (source).
// The function should print the vertices in breadth-first
// traversal order.

function bfs(adjList, source) {
  // implementation goes here
  const visited = new Set([source]);
  const queue = [source];

  while (queue.length > 0) {
    let curr = queue.shift();
    console.log(curr);

    for (let neighbor of adjList.get(curr)) {
      if (!visited.has(neighbor)) {
        queue.push(neighbor); 
        visited.add(neighbor);
      }
    }
  }
}

const adjList3 = new Map();
adjList3.set(1, [2, 3]);
adjList3.set(2, [1, 4]);
adjList3.set(3, [1, 4, 5]);
adjList3.set(4, [2, 3]);
adjList3.set(5, [3, 6]);
adjList3.set(6, [5]);

bfs(adjList3, 1); // 1, 2, 3, 4, 5, 6 or 1, 3, 2, 5, 4, 6
