# A circular queue is a collection of objects stored in a buffer that is treated as though it is connected end-to-end in a circle. When an object is added to this circular queue, it is added to the position that immediately follows the most recently added object, while removing an object always removes the object that has been in the queue the longest.

# Circular Queue
# This works as long as there are empty spots in the buffer. If the buffer becomes full, adding a new object to the queue requires getting rid of an existing object; with a circular queue, the object that has been in the queue the longest is discarded and replaced by the new object.

# Assuming we have a circular queue with room for 3 objects, the circular queue looks and acts like this:

# P1	P2	P3	Comments
# All positions are initially empty
# 1			Add 1 to the queue
# 1	2		Add 2 to the queue
# 2		Remove oldest item from the queue (1)
# 2	3	Add 3 to the queue
# 4	2	3	Add 4 to the queue, queue is now full
# 4		3	Remove oldest item from the queue (2)
# 4	5	3	Add 5 to the queue, queue is full again
# 4	5	6	Add 6 to the queue, replaces oldest element (3)
# 7	5	6	Add 7 to the queue, replaces oldest element (4)
# 7		6	Remove oldest item from the queue (5)
# 7			Remove oldest item from the queue (6)
# Remove oldest item from the queue (7)
# Remove non-existent item from the queue (nil)
# Your task is to write a CircularQueue class that implements a circular queue for arbitrary objects. The class should obtain the buffer size with an argument provided to CircularQueue::new, and should provide the following methods:

# enqueue to add an object to the queue
# dequeue to remove (and return) the oldest object in the queue. It should return nil if the queue is empty.
# You may assume that none of the values stored in the queue are nil (however, nil may be used to designate empty spots in the buffer).

class CircularQueue
  attr_reader :queue
  @@current_action_id = 0

  def initialize(buffer_size)
    @queue = Array.new
    (1..buffer_size).each do |i|
      @queue << QueueObject.new(i, nil, @@current_action_id)
    end
  end

  def enqueue(value)
    dequeue if full?
    find_oldest_element(empty_spots).update(value, @@current_action_id)
    @@current_action_id += 1
  end

  def dequeue
    return nil if filled_spots.empty?
    object_to_dequeue = find_oldest_element(filled_spots)
    dequeued_value = object_to_dequeue.value
    object_to_dequeue.update(nil, @@current_action_id)
    @@current_action_id += 1
    dequeued_value
  end
  
  private

  def empty_spots
    queue.select { |object| object.value.nil? }
  end

  def filled_spots
    queue - empty_spots
  end

  def find_oldest_element(queue_objects)
    queue_objects.min_by { |object| object.last_action_id}
  end

  def full?
    empty_spots.empty?
  end
end

class QueueObject
  attr_accessor :value, :last_action_id

  def initialize(position, value, last_action_id)
    @position = position
    @value = value
    @last_action_id = last_action_id
  end

  def update(value, last_action_id)
    self.value = value
    self.last_action_id = last_action_id
  end
end

# Further Exploration
# Phew. That's a lot of work, but it's a perfectly acceptable solution to this exercise. However, there is a simpler solution that uses an Array, and the #push and #shift methods. See if you can find a solution that does this. And no, you're not allowed to monkey-patch the Array class, though doing so may help you determine what needs to be done.
=begin
# Buffer nil nil nil || 1 2 3 || 1 _ 3
# Case: Can there be a nil to the right that is 'older' than a nil to the left?
  1 2 _
  _ 2 _ dq ()
  _ 2 3 eq(3)

  1 2 _ -> dq (Array .shift)
  2 _   -> eq(3)

# Enqueue
  # If 

=end

# Examples:

queue = CircularQueue.new(3)


puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil
# The above code should display true 15 times.