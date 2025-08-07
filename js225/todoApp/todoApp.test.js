const {Todo, TodoList, TodoManager} = require('./todoApp');

let todoData1 = {
  title: 'Buy Milk',
  month: '1',
  year: '2017',
  description: 'Milk for baby',
};

let todoData2 = {
  title: 'Buy Apples',
  month: '',
  year: '2017',
  description: 'An apple a day keeps the doctor away',
};

let todoData3 = {
  title: 'Buy chocolate',
  month: '1',
  year: '2017',
  description: 'For the cheat day',
};

let todoData4 = {
  title: 'Buy Veggies',
  month: '',
  year: '',
  description: 'For the daily fiber needs',
};

let todoSet = [todoData1, todoData2, todoData3, todoData4];

describe('Todo class tests', () => {
  test('Todo creates unique ids', () => {
    let todo1 = new Todo('groceries', '1', '2025', 'buy groceries after work');
    let todo2 = new Todo('pay bills', '1', '2025', 'pay monthly bills');
    expect(todo1.id).not.toBe(todo2.id);
  });

  test('Todo creates `completed` property that defaults to `false`', () => {
    let todo1 = new Todo('groceries', '1', '2025', 'buy groceries after work');
    expect(todo1.completed).toBe(false);
  });

  test('Todo objects have access to isWithinMonthYear method via prototype', () => {
    let todo1 = new Todo('groceries', '1', '2025', 'buy groceries after work');

    expect(todo1.hasOwnProperty('title')).toBe(true);
    expect(todo1.isWithinMonthYear('1', '2025')).toBe(true);
    expect(todo1.hasOwnProperty('isWithinMonthYear')).toBe(false);
  });
});

describe('TodoList creation tests', () => {
  test('Instantiates with multiple todoData in an array', () => {
    let todoList = new TodoList(todoSet)
    expect(todoList.todos.length).toBe(todoSet.length);
  });

  test('Can still instantiate without any provided todoSet', () => {
    let todoList = new TodoList()
    expect(todoList.todos.length).toBe(0);
  });
});

describe('TodoList CRUD operations', () => {
  let todoList = new TodoList();

  test('Adding to list', () => {
    todoList.add(todoData1);
    todoList.add(todoData2);
    expect(todoList.todos.length).toBe(2);
  });

  test('Find todo with id', () => {
    let id = todoList.todos[0].id;
    expect(todoList.findTodo(id)).toStrictEqual(todoList.todos[0]);
  });

  test('Find todo with invalid id throws error', () => {
    let find = () => {
      todoList.findTodo(Infinity)
    }
    expect(() => find()).toThrow("No todo found!");
  });

  test('Updating todo property', () => {
    let id = todoList.todos[0].id;

    todoList.update(id, 'title', 'Buy Chocolate Milk');
    expect(todoList.todos[0].title).toBe('Buy Chocolate Milk');
  });

  test('Updating with invalid id throws error', () => {
    let update = () => {
      todoList.update(Infinity, 'title', 'Buy Chocolate Milk');
    }

    expect(() => update()).toThrow('No todo found!');
  });

  test('Updating invalid property throws error', () => {
    let update = () => {
      let id = todoList.todos[0].id;
      todoList.update(id, 'importance', 'Superimportant');
    };

    expect(() => update()).toThrow('Invalid property');
  });

  test('Updating id property throws error', () => {
    update = () => {
      let id = todoList.todos[0].id;
      todoList.update(id, 'id', '100');
    };

    expect(() => update()).toThrow('Invalid property');
  });

  test('Deleting from list', () => {
    let startingLength = todoList.todos.length;
    todoList.delete(todoList.todos[0].id);
    expect(todoList.todos.length).toBe(startingLength - 1);
  });

  test('Collection integrity maintained when attempting to access todos property directly', () => {
    let startingLength = todoList.todos.length;
    todoList.todos.pop();
    expect(todoList.todos.length).toBe(startingLength);
  });

});

describe('TodoList interface preserves object integrity', () => {
  let todoList = new TodoList(todoSet);
  let listManager = new TodoManager(todoList);

  test ('Todo returned by findTodo is a copy', () => {
    let foundTodo = todoList.findTodo(todoList.todos[0].id);
    foundTodo.id = Infinity;
    expect(todoList.findTodo(todoList.todos[0].id).id).toBe(0);
  });

  test ('Todos returned by TodoManager queries are copies', () => {
    let queryResult1 = listManager.getAllTodos();
    let queryResult2 = listManager.getAllTodos();

    expect(queryResult1[0]).toStrictEqual(queryResult2[0]);
    expect(queryResult1[0]).not.toBe(queryResult2[0]);

    let testObject = queryResult1[0];
    testObject.id = Infinity;
    expect(listManager.getAllTodos()[0].id).toBe(0);
  });

  test ('Todo prototype is frozen to prevent adding additional methods', () => {
    let addMethod = () => {
      let foundTodo = todoList.findTodo(todoList.todos[0].id);
      Object.getPrototypeOf(foundTodo).someNewMethod = function() {return 'new method!'};

      foundTodo.someNewMethod();
    };

    expect(() => addMethod()).toThrow();
  });

});

describe('TodoManager tests', () => {
  let todoList = new TodoList(todoSet);
  let listManager = new TodoManager(todoList);

  test('Return all todo objects', () => {
    let allTodos = listManager.getAllTodos();
    expect(allTodos.length).toBe(todoSet.length);
  });

  test('Return all completed todo objects', () => {
    todoList.todos.slice(0,2).forEach(todo => {
      let id = todo.id;
      todoList.update(id, 'completed', true);
    })

    let allCompletedTodos = listManager.getAllCompletedTodos();
    expect(allCompletedTodos.length).toBe(2);
  });

  test('Return all todos with given month year combination', () => {
    let january2017Todos = listManager.getTodosWithMonthYear('1', '2017');
    expect(january2017Todos.length).toBe(2);
  });

  test('Return all completed todos with given month year combination', () => {
    let completedJanuary2017Todos = listManager.getCompletedTodosWithMonthYear('1', '2017');

    expect(completedJanuary2017Todos.length).toBe(1);
  });

  test('Access to todos does not permit mutation of the todoList collection', () => {
    let allTodos = listManager.getAllTodos();
    allTodos.push(1, 2, 3);
    expect(todoList.todos.length).toBe(todoSet.length);
  });
});