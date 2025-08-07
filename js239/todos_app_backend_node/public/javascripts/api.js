const API_BASE_URL = "http://localhost:3000/api/todos";
const API_RESET_URL = "./api/reset";


const api = {
  async fetchAllTodos() {
    try {
      const response = await fetch(API_BASE_URL);
      if (!response.ok) throw new Error("Failed to fetch todos");
      return await response.json();
    } catch (error) {
      console.error("API fetchAllTodos error:", error);
      throw error;
    }
  },

  processTextDates(todoData) {
    if (todoData.day === "Day") todoData.day = "";
    if (todoData.month === "Month") todoData.month = "";
    if (todoData.year === "Year") todoData.year = "";
  },

  async addTodo(todoData) {
    this.processTextDates(todoData);

    try {
      const response = await fetch(API_BASE_URL, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(todoData)
      });

      if (!response.ok) throw new Error("Failed to add todo");
      return await response.json();
    } catch (error) {
      console.error("API addTodo error:", error);
      throw error;
    }
  },

  async updateTodo(todoId, todoData) {
    this.processTextDates(todoData);

    try {
      const response = await fetch(`${API_BASE_URL}/${todoId}`, {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(todoData)
      });

      if (!response.ok) throw new Error(`Failed to update todo ${todoId}`);
      return await response.json();
    } catch (error) {
      console.error("API updateTodo error:", error);
      throw error;
    }
  },

  async deleteTodo(todoId) {
    try {
      const response = await fetch(`${API_BASE_URL}/${todoId}`, {
        method: "DELETE"
      });

      if (!response.ok) throw new Error(`Failed to delete todo ${todoId}`);
    } catch (error) {
      console.error("API deleteTodo error:", error);
      throw error;
    }
  },

  async retrieveTodo(todoId) {
    try {
      const response = await fetch(`${API_BASE_URL}/${todoId}`);
      console.log(response);
      if (!response.ok) throw new Error(`Failed to retrieve todo ${todoId}`);
      return await response.json();
    } catch (error) {
      console.error("API retrieveTodo error:", error);
      throw error;
    }
  },

  async resetDatabase() {
    try {
      const response = await fetch(API_RESET_URL);
      if (!response.ok) throw new Error("Failed to reset database");
    } catch (error) {
      console.error("API resetDatabase error:", error);
      throw error;
    }
  }
}

export default api;