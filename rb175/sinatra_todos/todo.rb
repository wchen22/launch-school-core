require "sinatra"
require "sinatra/reloader" if development?
require "sinatra/content_for"
require "tilt/erubis"

configure do
  enable :sessions
  set :session_secret, SecureRandom.hex(32)
end

before do
  session[:lists] ||= []
  @lists = session[:lists]

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
    @lists << { name: list_name, todos: []}
    session[:success] = "The list has been created."
    redirect "/lists"
  end
end

# Display a list and the tasks in it

get "/lists/:id" do
  @list_id = params[:id].to_i
  @list = @lists[@list_id]
  @todos = @list[:todos]
  erb :list, layout: :layout
end

get "/lists/:id/edit" do
  @list_id = params[:id].to_i
  @list = @lists[@list_id]
  erb :edit_list, layout: :layout
end

post "/lists/:id" do
  list_name = params[:list_name].strip
  @list_id = params[:id].to_i
  @list = @lists[@list_id]

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
  @lists.delete_at(id)
  session[:success] = "The list has been deleted."
  redirect "/lists"
end

def error_for_todo_name(name)
  if !(1..100).cover?(name.size)
    "List name must be between 1 and 100 characters"
  end
end

# From a form on a list page, add a task to the list
post '/lists/:list_id/todos' do
  @list_id = params[:list_id].to_i
  @list = @lists[@list_id]
  todo_name = params[:todo].strip

  error = error_for_todo_name(todo_name)
  if error
    session[:error] = error
    erb :list, layout: :layout
  else
    session[:success] = "The todo was added."
    @lists[@list_id][:todos] << {name: todo_name, completed: false}
    redirect "/lists/#{@list_id}"
  end

  # Expand data structure to hold todos? x
  # Add the todo to the data structure.  x
  # Redirect to lists/id page.  x
  # Validation: blank, 1-100 chars
end

# Delete a todo from a list
post '/lists/:list_id/todos/:todo_id/delete' do
  @list_id = params[:list_id].to_i
  @list = @lists[@list_id]
  deleted_task = @list[:todos].delete_at(params[:todo_id].to_i)
  session[:success] = "#{deleted_task[:name]} has been deleted"

  redirect "/lists/#{@list_id}"
end

# Toggle todo list item status

# Have the form send explicit true or false value to the route
# The list :completed should have true or false value
# The route will receive true/false as a string and will have to update the
#.   todos list accordingly
# in list.erb, have a conditional for <li class> depending on value of todo[:completed]
post '/lists/:list_id/todos/:todo_id/' do
  @list_id = params[:list_id].to_i
  @list = @lists[@list_id]
  index = params[:todo_id].to_i

  state = params[:state] == "true"
  @list[:todos][index][:completed] = state
  
  session[:success] = "The todo has been updated"
  redirect "/lists/#{@list_id}"
end

# Complete all todos in the list
post '/lists/:id/complete_all' do
  @list_id = params[:id].to_i
  @list = @lists[@list_id]

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
    incomplete_lists = {}
    complete_lists = {}

    lists.each_with_index do |list, index|
      if list_complete?(list)
        complete_lists[list] = index
      else
        incomplete_lists[list] = index
      end
    end

    incomplete_lists.each(&block)
    complete_lists.each(&block)
  end

  def sort_todos(todos, &block)
    incomplete_todos = {}
    complete_todos = {}

    todos.each_with_index do |todo, index|
      if todo[:completed]
        complete_todos[todo] = index
      else
        incomplete_todos[todo] = index
      end
    end

    incomplete_todos.each(&block)
    complete_todos.each(&block)
  end
end

=begin

Use view helpers to apply styles

Sort and filter with view helpers

Deploy to heroku
=end