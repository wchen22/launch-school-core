class Todo { 
  static nextId = 0;

  constructor(title, month, year, description) {
    this.id = Todo.nextId;
    Object.freeze(this.id);
    Todo.nextId += 1;

    this.title = title;
    this.month = month;
    this.year = year;
    this.description = description;
    this.completed = false;
  }

  isWithinMonthYear(month, year) {
    return month === this.month && year === this.year;
  }
}

class TodoList {
  #todos = [];
  #WRITEABLE_PROPERTIES = ['title', 'month', 'year', 'description', 'completed'];

  constructor(todoSet = []) {
    todoSet.forEach(todoData => this.add(todoData));
  }

  add(todoData) {
    this.#todos.push(this.#createTodoFromData(todoData));
  }

  delete(todoId) {
    let index = this.#todos.findIndex(todo => todo.id === todoId);
    this.#todos.splice(index, 1);
  }

  update(todoId, property, value) {
    if(!this.#validProperty(property)) throw new Error("Invalid property");

    let todo = this.#retrieveTodo(todoId);

    todo[property] = value;
  }

  findTodo(todoId) {
    return this.#createTodoCopy(this.#retrieveTodo(todoId));
  }

  #retrieveTodo(todoId) {
    let match = this.#todos.find(todo => todo.id === todoId);
    if (!match) throw new Error("No todo found!");
    return match;
  }

  #validProperty(property) {
    return this.#WRITEABLE_PROPERTIES.includes(property);
  }

  #createTodoFromData(todoData) {
    let orderedData = [
      todoData.title,
      todoData.month,
      todoData.year,
      todoData.description
    ];

    return new Todo(...orderedData);
  }

  #createTodoCopy(todo) {
    let prototypeTemplate = Object.create(Todo.prototype);
    return Object.assign(prototypeTemplate, todo);
  }

  get todos() {
    return this.#todos.map(todo => this.#createTodoCopy(todo));
  }
}

class TodoManager {
  constructor(todoList) {
    this.list = todoList;
  }

  getAllTodos() {
    return this.list.todos;
  }

  getTodosWithMonthYear(month, year) {
    return this.getAllTodos().filter(todo => todo.isWithinMonthYear(month, year));
  }

  getAllCompletedTodos() {
    return this.getAllTodos().filter(this.#isCompleted);
  }

  getCompletedTodosWithMonthYear(month, year) {
    return this.getTodosWithMonthYear(month, year).filter(this.#isCompleted);
  }

  #isCompleted(todo) {
    return todo.completed;
  }
}

Object.freeze(Todo.prototype);

module.exports = {
  Todo,
  TodoList,
  TodoManager,
};