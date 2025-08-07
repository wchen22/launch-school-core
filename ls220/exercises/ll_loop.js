// Loop in a Linked List
// Given the starting node (head) of a singly linked list, your task is to find whether the linked list contains a loop. A loop in a linked list exists when a node can be revisited by continuously following the next pointers.

// You should return true if the linked list forms a loop (sometimes referred to as a circular list or a cyclic list) and false if it does not.

// This problem is very tricky. Try it for 15-20 minutes and then check the provided Hint

// Example test cases:

function ListNode(val) {
  this.val = val;
  this.next = null;
}

function createLinkedList(arr, cyclePos) {
  let head = new ListNode(0);
  let current = head;
  let cycleNode = null;

  arr.forEach((val, index) => {
    current.next = new ListNode(val);
    current = current.next;
    if (index === cyclePos) {
      cycleNode = current;
    }
  });

  if (cycleNode) {
    current.next = cycleNode;
  }

  return head.next;
}

function hasCycle(head) {
  let curr = head;
  let traversed = new Set

  while (curr && curr.next) {
    if (traversed.has(curr)) {
      return true;
    } else traversed.add(curr);
    curr = curr.next;
  }
  return false;
}

let list1 = createLinkedList([3, 2, 0, -4], 1);
let list2 = createLinkedList([1, 2], 0);
let list3 = createLinkedList([1], -1);
let list4 = createLinkedList([10, 20, 30, 40, 50, 60], 3);
let list5 = createLinkedList([5, 15, 25, 35, 45], -1);

function printList(list) {
  let curr = list;
  while (curr) {
    console.log(curr.val);
    curr = curr.next;
  }
}

//printList(list1);

console.log(hasCycle(list1)); // true
console.log(hasCycle(list2)); // true
console.log(hasCycle(list3)); // false
console.log(hasCycle(list4)); // true
console.log(hasCycle(list5)); // false