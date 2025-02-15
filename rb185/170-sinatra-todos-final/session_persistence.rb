class SessionPersistence
  def initialize(session)
    @session = session
    @session[:lists] ||= []
  end

  def find_list(id)
    all_lists.find{ |list| list[:id] == id }
  end

  def all_lists
    @session[:lists]
  end

  def create_new_list(list_name)
    id = next_element_id(all_lists)
    all_lists << { id: id, name: list_name, todos: [] }
  end

  def update_list_name(id, new_name)
    find_list(id)[:name] = new_name
  end

  def delete_list(id)
    all_lists.reject! { |list| list[:id] == id }
  end

  def add_new_todo(list_id, text)
    list = find_list(list_id)
    id = next_element_id(list[:todos])
    list[:todos] << { id: id, name: text, completed: false }
  end

  def delete_todo(list_id, todo_id)
    list = find_list(list_id)
    list[:todos].reject! { |todo| todo[:id] == todo_id }
  end

  def update_todo_status(list_id, todo_id, new_status)
    list = find_list(list_id)
    todo = list[:todos].find { |t| t[:id] == todo_id }
    todo[:completed] = new_status
  end

  def mark_all_todos_complete(list_id)
    list = find_list(list_id)
    list[:todos].each do |todo|
      todo[:completed] = true
    end
  end

  private

  def next_element_id(elements)
    max = elements.map { |todo| todo[:id] }.max || 0
    max + 1
  end
end
