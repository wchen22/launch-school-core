class ListNode {
  constructor(val = 0, next = null) {
    this.val = val;
    this.next = next;
  }
}

function createLinkedList(...values) {
  console.log(values)
  const head = new ListNode(values[0]);
  values.slice(1).reduce((node, value) => {
    node.next = new ListNode(value);
    return node.next;
  }, head);

  return head;
}

function stringifyList(head) {
  let curr = head;
  let result = "";
  while (curr !== null) {
    result += curr.val + " -> ";
    curr = curr.next;
  }
  result += "null";
  return result;
}

let list1 = createLinkedList(1, 2, 3, 4);
console.log(stringifyList(list1));

function reverse(head) {
  let prev = null;
  let curr = head;

  while (curr !== null) {
    let nextNode = curr.next; // save the next node
    curr.next = prev;
    prev = curr;
    curr = nextNode;
  }

  // iterate down the nodes
    // at each one, save the nextNode
    // point the curr.next to prev
  return prev;
}

// console.log(stringifyList(reverse(list1)));
list1 = reverse(list1);

console.log(stringifyList(list1));
