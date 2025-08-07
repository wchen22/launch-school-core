import templater from "./templates.js";
import api from "./api.js";

class TodoList {
  constructor() {
    this.todos = null;
  }

  async addTodo(todoData) {
    const newTodo = await api.addTodo(todoData);
    this.todos.push(newTodo);
  }

  async updateTodo(todoId, todoData) {
    const updatedTodo = await api.updateTodo(todoId, todoData);
    const todoIndex = this.todos.findIndex(todo => todo.id === todoId);
    this.todos[todoIndex] = updatedTodo;
  }

  async deleteTodo(todoId) {
    await api.deleteTodo(todoId);
    const todoIndex = this.todos.findIndex(todo => todo.id === todoId);
    this.todos.splice(todoIndex, 1);
  }

  retrieveTodo(todoId) {
    return this.todos.filter(todo => todo.id === (todoId))[0];
  }

  todosByDate(todosArray) {
    if (!todosArray) todosArray = this.todos
    const result = {}
    todosArray.forEach(({month, year}, index) => {
      const dueDate = (month && year) ? `${month}/${year.slice(-2)}` :
                                        "No Due Date";

      if (result[dueDate]) {
        result[dueDate].push(todosArray[index]);
      } else result[dueDate] = [todosArray[index]];
    });

    return result;
  }

  doneTodos() {
    return this.todos.filter(todo => {
      return todo.completed;
    })
  }

  doneTodosByDate() {
    return this.todosByDate(this.doneTodos());
  }

  async getTodosForDataTitle(dataTitleObject) {
    if (!this.todos)  {
      this.todos = await api.fetchAllTodos();
    }

    const dataTitle = dataTitleObject.dataTitle;
    const completed = dataTitleObject.completed;

    let queriedTodos;
    if (dataTitle === "All Todos") {
      queriedTodos = this.todos;
    } else if (dataTitle === "Completed") {
      queriedTodos = this.doneTodos();
    } else if (dataTitle === "No Due Date") {
      queriedTodos = this.todos.filter(todo => {
        if (completed === true) {
          return (!todo.month || !todo.year) && (completed === todo.completed);
        } else {
          return (!todo.month || !todo.year);
        }
      });
    } else {
      const [month, year] = dataTitle.split("/");

      queriedTodos = this.todos.filter(todo => {
        if (completed === true) {
          return (month === todo.month &&
                  year === todo.year.slice(-2) &&
                  completed === todo.completed);
        } else {
          return (month === todo.month &&
                  year === todo.year.slice(-2));
        }
      });
    }
    return queriedTodos.sort((todoA, todoB) => {
      return todoA.completed - todoB.completed
    });
  }

  async getTemplateObject(dataTitleObject) {
    const selected = await this.getTodosForDataTitle(dataTitleObject);
    const currentSection = {
      title: dataTitleObject.dataTitle,
      data: selected.length
    };

    const templateObject = {
      todos: this.todos,
      todos_by_date: this.todosByDate(),
      done: this.doneTodos(),
      done_todos_by_date: this.doneTodosByDate(),
      current_section: currentSection,
      selected: selected
    };

    return templateObject;
  }
}

class TodoApp {
  #activeMenuElement;

  constructor() {
    this.todos = new TodoList();
    this.activeTodo = null;
    this.contentDiv = document.getElementById('content');
  }

  async init() {
    await this.renderFullPage();
    this.bind();
  }

  selectElements() {
    this.selectedTodos = document.getElementById('selected_todos');
    this.modal = document.getElementById('form_modal');
    this.modalLayer = document.getElementById('modal_layer');
    this.addTodoButton = document.getElementById('add_todo');
    this.allHeader = document.getElementById('all_header');
    this.activeListTitle = document.querySelector('#items header');

    this.form = this.modal.querySelector('form');
    this.form.addEventListener('submit', event => this.handleFormSubmit(event));
  }

  bind() {
    const handleCheck = async (event) => {
      const todoRow = event.target.closest('tr');
      const todoId = Number(todoRow.dataset.id);
      const checkbox = todoRow.querySelector('input[type="checkbox"]');
      await this.todos.updateTodo(todoId, {completed: !checkbox.checked});
      await this.renderFullPage();
    }

    const handleOpenTodoModal = async (event) => {
      event.preventDefault();
      const todoRow = event.target.closest('tr');
      const todoId = Number(todoRow.dataset.id);
      const todoData = await this.todos.retrieveTodo(todoId);
      this.openModal(todoData);
    }

    const handleDelete = async (event) => {
      const todoRow = event.target.closest('tr');
      const todoId = Number(todoRow.dataset.id);
      await this.todos.deleteTodo(todoId);
      await this.renderFullPage();
    }

    const handleSelectDifferentList = async (event) => {
      const navRow = event.target.closest('[data-title]');
      if (navRow.classList.contains('active')) return;
      this.activeMenuElement = navRow;
      this.renderActiveTitle(navRow.dataset.title, navRow.dataset.total);
      await this.renderActiveList();
    }

    document.addEventListener('click', async event => {
      try {
        if (event.target.matches('#add_todo')) {
          this.openModal();
        } else if (event.target.matches('#modal_layer')) {
          this.closeModal();
        } else if (event.target.matches('tr td.list_item label')) {
          await handleOpenTodoModal(event);
        } else if (event.target.closest('td.list_item')) {
          await handleCheck(event);
        } else if (event.target.closest('.delete')) {
          await handleDelete(event);
        } else if (event.target.closest('[data-title]')) {
          await handleSelectDifferentList(event);
        }       
      } catch(error) {
        alert ('Oops, something went wrong: ' + String(error));
      }
  
    });
  }
  
  get activeMenuElement() {
    return this.#activeMenuElement;
  }

  set activeMenuElement(element) {
    if (element === null) return;
    let menuElements = document.querySelectorAll('#sidebar [data-title]');
    for (const item of menuElements) {
      item.classList.remove('active');
    }
    element.classList.toggle('active');
    this.#activeMenuElement = element;
  }

  get activeDataTitleObject() {
    if (!this.activeMenuElement) {
      return {dataTitle: 'All Todos', completed: false}
    } else {
      const dataTitle = this.activeMenuElement.dataset.title;
      const completed = this.activeMenuElement.closest('section').id === 'completed_items';
  
      return {dataTitle: dataTitle, completed: completed};
    }
  }

  openModal(todoData) {
    if (todoData) {
      this.activeTodo = todoData;
      this.form.querySelector('#title').value = todoData.title;
      this.form.querySelector('#due_day').value = todoData.day || 'Day';
      this.form.querySelector('#due_month').value = todoData.month || 'Month';
      this.form.querySelector('#due_year').value = todoData.year || 'Year';
      this.form.querySelector('textarea[name="description"]').value = todoData.description;
    }

    this.modal.style.display = 'block';
    this.modalLayer.style.display = 'block';
  }

  closeModal() {
    this.modal.style.display = 'none';
    this.modalLayer.style.display = 'none';
    this.activeTodo = null;
    this.form.reset();
  }

  currentActiveDataTitle() {
    const currentActiveSection = document.querySelector('#sidebar [data-title].active')

    if (!currentActiveSection) return null;
    
    const dataTitle = currentActiveSection.dataset.title;
    const completed = currentActiveSection.closest('section').id === 'completed_items';

    return {dataTitle: dataTitle, completed: completed};
  }

  resetSidebar() {
    let headers = document.querySelectorAll('#sidebar [data-title]');
    for (const row of headers) {
      row.classList.remove('active');
    }
  }

  renderActiveTitle(title, total) {
    const templateObject = {title: title, data: total};
    this.activeListTitle.innerHTML = templater.titleTemplate(templateObject);
  }

  async renderActiveList() {
    const activeTodos = await this.todos.getTodosForDataTitle(this.activeDataTitleObject);    
    this.selectedTodos.innerHTML = templater.listTemplate(activeTodos);
  }

  refreshActiveMenuElement() {
    if (!this.activeMenuElement) {
      this.allHeader.classList.toggle('active');
    } else {
      const activeTitle = this.activeMenuElement.dataset.title;
      const sectionId = this.activeMenuElement.closest('section').id;
      this.activeMenuElement = document.querySelector(`#sidebar section[id="${sectionId}"] [data-title="${activeTitle}"]`);
    }
  }

  async renderFullPage() {
    const template = await this.todos.getTemplateObject(this.activeDataTitleObject);
    this.contentDiv.innerHTML = templater.mainTemplate(template);
    this.selectElements();
    this.refreshActiveMenuElement();
  }

  async changeTodosView(todos) {
    let sortedTodos = todos.sort((a, b) => a.completed - b.completed);
    this.selectedTodos.innerHTML = templater.listTemplate(sortedTodos);
  }

  async handleFormSubmit(event) {
    event.preventDefault();
    const submitter = event.submitter;

    try {
      if (submitter && submitter.name === 'complete') {
        if (this.activeTodo) {
          await this.todos.updateTodo(this.activeTodo.id, {completed: true});
          this.closeModal();
          await this.renderFullPage();
        } else {
          alert('Cannot mark as complete a todo before saving it!');
        }
        return;
      }
  
      const formData = new FormData(this.form);
      let data = Object.fromEntries(formData.entries());
  
      if (data.title.length < 3){
        alert('Todo name must be 3 characters or more');
        return;
      }
  
      if (this.activeTodo) {
        let formattedData = this.#formatFormObject(data, this.activeTodo.completed);
        await this.todos.updateTodo(this.activeTodo.id, formattedData);
        this.closeModal();
        await this.renderFullPage();
      } else {
        await this.todos.addTodo(this.#formatFormObject(data));
        this.activeMenuElement = this.allHeader;
        await this.renderFullPage();
      }
    } catch(error) {
      alert ('Oops, something went wrong: ' + String(error));
    }

  }

  #formatFormObject(data, completed = false) {
    data.completed = completed;
    const mapped = {};
    const keyMap = {
      title: 'title',
      description: 'description',
      due_day: 'day',
      due_month: 'month',
      due_year: 'year',
      completed: 'completed'
    };

    Object.entries(data).forEach(([key, value]) => {
      let newKey = keyMap[key];
      mapped[newKey] = value;
    });
    
    return mapped;
  }
}

async function main() {
  const todoApp = new TodoApp();
  todoApp.init();
}

document.addEventListener('DOMContentLoaded', main);