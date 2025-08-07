### Todos App assumptions and details
* Created a separate api module for encapsulating requests and responses with the server
* Created TodoApp class responsible for rendering the page and manipulating the DOM
* Created TodoList class as a middle layer between TodoApp and the api module 
  responsible for the todo list state and queries on the state
  * Decided to have client-side todos array populated with a full request to server API 
    just once, and additional user operations afterward (Create, Update, Delete) would
    be reflected dynamically by interacting with this local todos array instead of 
    re-fetching the entire todo list from the server after each operation.
* Errors, in particular those thrown by rejected requests to the server, propagate to the
  level of TodoApp methods. A general approach is taken to catch these errors by alerting
  the user of the error with the propagated error message.
