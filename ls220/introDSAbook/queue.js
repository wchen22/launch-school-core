class ListNode {
  constructor(val = 0, next = null) {
    this.val = val;
    this.next = next;
  }
}

class Queue {
  constructor() {
    this.front = null;
    this.back = null;
  }
  peek() {
    return this.front ? this.front.val : null;
    // Returns the value of the top most element without removing it.

    // If the queue is empty, it returns `null`.
  }

  enqueue(value) {
    // Adds an item to the queue
    let next = new ListNode(value);
    if (this.front === null) {
      this.back = next;
      this.front = next;
    } else {
      this.back.next = next;
      this.back = next;
    }
  }

  dequeue() {
    if (this.front === null) return null;
    let item = this.front;
    this.front = this.front.next;

    if (this.front === null) this.back = null;
    return item.val;
    //this.front = this.ne


    // Removes the item from the queue and returns it

    // If the queue is empty, it returns `null`.
  }
}

const myQueue = new Queue();
myQueue.enqueue(1);
console.log('Front element:', myQueue.peek());  // logs 'Front element: 1'
myQueue.enqueue(2);
console.log('Front element:', myQueue.peek());  // logs 'Front element: 1'
myQueue.enqueue(3);
//console.log(myQueue)
console.log('Front element:', myQueue.peek());  // logs 'Front element: 1'
myQueue.dequeue();
console.log('Front element after dequeue:', myQueue.peek());  // logs 'Front element after dequeue: 2'
myQueue.dequeue();
console.log('Front element after dequeue:', myQueue.peek());  // logs 'Front element after dequeue: 3'
myQueue.dequeue();
console.log('Peek on empty queue:', myQueue.peek());  // logs 'Peek on empty queue: null'
console.log('`back` on empty queue:', myQueue.back);  // logs '`back` on empty queue: null'