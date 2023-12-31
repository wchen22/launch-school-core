# In this assignment, we're going to create a TodoList which contains a collection of Todo objects. Internally to TodoList, we'll use an Array to back the collection of Todo objects.

# We'll first take a look at the Todo class.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end
 
  # add task to end of list, return list 
  # raises TypeError with message "Can only add Todo objects"
  def add(task)
    raise TypeError, "Can only add Todo objects" if task.class != Todo
    @todos << task
  end

  alias << add

  # return list size
  def size
    @todos.size 
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def to_a #return an array of list items
    @todos.dup
  end

  def done? #true if all todos in the list are done, false otherwise
    @todos.all? { |todo| todo.done?}
  end

  def done! #mark all items as done
    @todos.each { |todo| todo.done!}
  end

  def item_at(index) #return argumenterror if no arg, indexerror if OOB
    @todos.fetch(index)
  end

  def mark_done_at(index)
    @todos.fetch(index).done!
  end

  def mark_undone_at(index)
    @todos.fetch(index).undone!
  end

  def shift #remove and return 1st
    @todos.shift
  end

  def pop #remove and return last
    @todos.pop
  end

  def remove_at(index) #remove and return item at 2nd index, also have arg and index errors
    @todos.delete(item_at(index))
  end

  def to_s # after a header, puts each
    "---- Today's Todos ----\n" +
    "#{@todos.join("\n")}"
  end

  def each
    @todos.each { |todo| yield(todo) }
    self
  end

  def select
    selected_list = TodoList.new(title)
    @todos.each { |todo| selected_list.add(todo) if yield(todo)}
    selected_list
  end

  # find_by_title	takes a string as argument, and returns the first Todo object that matches the argument. Return nil if no todo is found.
  def find_by_title(string)
    each { |todo| return todo if todo.title == string}
    nil
  end

  # all_done	returns new TodoList object containing only the done items
  def all_done
    select do |todo|
      todo.done?
    end
  end

  # all_not_done	returns new TodoList object containing only the not done items
  def all_not_done
    select do |todo|
      !todo.done?
    end
  end

  # mark_done	takes a string as argument, and marks the first Todo object that matches the argument as done.
  def mark_done(string)
    found_todo = find_by_title(string)
    found_todo.done! if found_todo
  end

  # mark_all_done	mark every todo as done
  def mark_all_done
    each do |todo|
      todo.done!
    end
  end

  # mark_all_undone	mark every todo as not done
  def mark_all_undone
    each do |todo|
      todo.undone!
    end
  end

end


# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list << (todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
#list.add(1)                     # raises TypeError with message "Can only add Todo objects"

# <<
# same behavior as add

# ---- Interrogating the list -----

# size
p list.size                       # returns 3

# first
p list.first                      # returns todo1, which is the first item in the list

# last
p list.last                       # returns todo3, which is the last item in the list

#to_a
puts list.to_a                      # returns an array of all items in the list

#done?
p list.done?                     # returns true if all todos in the list are done, otherwise false

# ---- Retrieving an item in the list ----

# item_at
#list.item_at                    # raises ArgumentError
p list.item_at(1)                 # returns 2nd item in list (zero based index)
# list.item_at(100)               # raises IndexError

# ---- Marking items in the list -----

# mark_done_at
#list.mark_done_at               # raises ArgumentError
list.mark_done_at(1)            # marks the 2nd item as done
# list.mark_done_at(100)          # raises IndexError

# mark_undone_at
# list.mark_undone_at             # raises ArgumentError
list.mark_undone_at(1)          # marks the 2nd item as not done,
# list.mark_undone_at(100)        # raises IndexError

# done!
list.done!                      # marks all items as done

# ---- Deleting from the list -----

# shift
#list.shift                      # removes and returns the first item in list

# pop
#list.pop                        # removes and returns the last item in list

# remove_at
# list.remove_at                  # raises ArgumentError
list.remove_at(1)               # removes and returns the 2nd item
#list.remove_at(100)             # raises IndexError

# ---- Outputting the list -----

# to_s
puts list
# ---- Today's Todos ----
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym

# or, if any todos are done

# ---- Today's Todos ----
# [ ] Buy milk
# [X] Clean room
# [ ] Go to gym


list.each do |todo|
  puts todo                   # calls Todo#to_s
end

# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym

undone = (list.select do |todo|
  todo.title.include?('milk')
end)

p list
p undone

p list.find_by_title("Bufy milk")