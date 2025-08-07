# General information
* Used jest as testing framework, executing `npm test` to run `todoApp.test.js` file

# Assumptions and Design Decisions for Todo app

## Todo class
### Unique ids
* Use a static `nextId` that starts at 0 and increments with each constructor invocation to ensure that each new todo object has a unique id. `Object.freeze(this.id)` is used to make the id immutable. 


## TodoList class

### Initializing the todolist
* Since the project specifically says "Initializes the collection...", it made sense to have the constructor invocation be the only time a todoSet of todoData can be used to populate a todo list with multiple todos. If we want to allow multiple todos to be added at one time in the future, it would be easy to to extend the class to include a new `addTodos(todoSet)` method that iterates over todoSet and invokes `this.add(todoData)` for each todoData object. 

### Can instantiate a todoList without a todoSet
* Set default parameter value of `todoSet` to `[]`

### Finding todos
* Raises an error if an invalid id is provided
  
### Updating todos
* Only allows properties specified in `#WRITEABLE_PROPERTIES` array, throwing an error if the property argument is invalid. Effectively prevents user from attempting to change `id` or pass in invalid properties to update.

### Getter for todos collection
* Using a getter to return a shallow copy of the TodoList instance's private `#todos` array ensures the integrity of the collection. Code in the `TodoManager` class (or any future code) that relies on accessing a collection using an expression like `someList.todos` will therefore only be returning a copy, and not the original collection.


## TodoManager class

### Decided to have it take a TodoList object in its constructor
* An alternative option was to have the `TodoManager` serve as a class whose static methods could take different lists as arguments. However, it felt like it'd be more user-friendly to instantiate a TodoManager that is associated with a specific todoList, and then be able to call methods on it without needing to supply a list argument every time. There is not much additional overhead with this arrangement since methods live on the prototype object for `TodoManager`; `TodoManager` instances just have their own copy of a `list` instance property. 