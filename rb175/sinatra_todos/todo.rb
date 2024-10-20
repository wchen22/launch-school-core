require "sinatra"
require "sinatra/reloader" if development?
require "sinatra/content_for"
require "tilt/erubis"

configure do
  enable :sessions
  set :session_secret, SecureRandom.hex(32)
  set :erb, :escape_html => true
end

before do
  session[:lists] ||= []
  @lists = session[:lists]

end

def load_list(id)
  list = @lists.find{ |list| list[:id] == id }
  return list if list

  session[:error] = "Specified list not found"
  redirect "/lists"
end

get "/" do
  redirect "/lists"
end

=begin
GET /lists         -> view all lists
GET /lists/new     -> new list form
POST /lists        -> create new list
GET /lists/1       -> view a single list
=end


# View list of lists
get "/lists" do
  erb :lists, layout: :layout
end

# Render the new list form
get "/lists/new" do
  erb :new_list, layout: :layout
end

# Return an error message if name is invalid, nil otherwise
def error_for_list_name(name)
  if @lists.any? {|list| list[:name] == name}
    "List must be unique"
  elsif !(1..50).cover?(name.size)
    "List name must be between 1 and 50 characters"
  end
end
# Create a new list
post "/lists" do
  list_name = params[:list_name].strip
  error = error_for_list_name(list_name)

  if error
    session[:error] = error
    erb :new_list, layout: :layout
  else
    id = next_element_id(@lists)
    @lists << { id: id, name: list_name, todos: []}
    session[:success] = "The list has been created."
    redirect "/lists"
  end
end

# Display a list and the tasks in it

get "/lists/:id" do
  @list_id = params[:id].to_i
  @list = load_list(@list_id)

  @todos = @list[:todos]
  erb :list, layout: :layout
end

get "/lists/:id/edit" do
  @list_id = params[:id].to_i
  @list = load_list(@list_id)
  erb :edit_list, layout: :layout
end

post "/lists/:id" do
  list_name = params[:list_name].strip
  @list_id = params[:id].to_i
  @list = load_list(@list_id)

  error = error_for_list_name(list_name)
  if error
    session[:error] = error
    erb :edit_list, layout: :layout
  else
    session[:success] = "#{@list[:name]} has been renamed to #{list_name}"
    @list[:name] = list_name
    redirect "/lists/#{@id}"
  end

end

post "/lists/:id/delete" do
  id = params[:id].to_i
  session[:lists].reject! { |list| list[:id] == id }
  if env["HTTP_X_REQUESTED_WITH"] == "XMLHttpRequest"
    "/lists"
  else
    session[:success] = "The list has been deleted."
    redirect "/lists"
  end
end

def error_for_todo_name(name)
  if !(1..100).cover?(name.size)
    "List name must be between 1 and 100 characters"
  end
end

def next_element_id(elements)
  max = elements.map { |element| element[:id] }.max || 0
  max + 1
end

# From a form on a list page, add a task to the list
post '/lists/:list_id/todos' do
  @list_id = params[:list_id].to_i
  @list = load_list(@list_id)
  todo_name = params[:todo].strip

  error = error_for_todo_name(todo_name)
  if error
    session[:error] = error
    erb :list, layout: :layout
  else
    session[:success] = "The todo was added."
    @list[:todos] << {id: next_element_id(@list[:todos]), name: todo_name, completed: false}
    redirect "/lists/#{@list_id}"
  end

  # Expand data structure to hold todos? x
  # Add the todo to the data structure.  x
  # Redirect to lists/id page.  x
  # Validation: blank, 1-100 chars
end

def find_todo(list, todo_id)
  list[:todos].find {|todo| todo[:id] == todo_id}
end

# Delete a todo from a list
post '/lists/:list_id/todos/:todo_id/delete' do
  @list_id = params[:list_id].to_i
  @list = load_list(@list_id)

  todo = find_todo(@list, params[:todo_id].to_i)
  #deleted_task = @list[:todos].delete_at(params[:todo_id].to_i)
  deleted_task = @list[:todos].delete(todo)

  if env["HTTP_X_REQUESTED_WITH"] == "XMLHttpRequest"
    status 204
  else
    session[:success] = "#{deleted_task[:name]} has been deleted"
    redirect "/lists/#{@list_id}"
  end
end

# Toggle todo list item status

# Have the form send explicit true or false value to the route
# The list :completed should have true or false value
# The route will receive true/false as a string and will have to update the
#.   todos list accordingly
# in list.erb, have a conditional for <li class> depending on value of todo[:completed]
post '/lists/:list_id/todos/:todo_id' do
  @list_id = params[:list_id].to_i
  @list = load_list(@list_id)
  todo = find_todo(@list, params[:todo_id].to_i)

  state = params[:completed] == "true"
  todo[:completed] = state
  
  session[:success] = "The todo has been updated"
  redirect "/lists/#{@list_id}"
end

# Complete all todos in the list
post '/lists/:id/complete_all' do
  @list_id = params[:id].to_i
  @list = load_list(@list_id)

  @list[:todos].each do |todo|
    todo[:completed] = true
  end
  
  session[:success] = "All todos have been marked as completed"
  redirect "/lists/#{@list_id}"
end

helpers do
  # Add a count/total to lists page
  def todos_count(list)
    list[:todos].size
  end

  def todos_remaining_count(list)
    list[:todos].select {|todo| !todo[:completed] }.size
  end

  def list_complete?(list)
    todos_count(list) > 0 && todos_remaining_count(list) == 0
  end

  def list_class(list)
    if list_complete?(list)
      "complete"
    else
      ""
    end
  end

  def sort_lists(lists, &block)
    complete_lists, incomplete_lists = lists.partition {|list| list_complete?(list)}
    incomplete_lists.each(&block)
    complete_lists.each(&block)
  end

  def sort_todos(todos, &block)
    complete_todos, incomplete_todos = todos.partition { |todo| todo[:completed] }
    incomplete_todos.each(&block)
    complete_todos.each(&block)
  end
end

=begin

Use view helpers to apply styles

Sort and filter with view helpers

Deploy to heroku
=end