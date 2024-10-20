require 'sinatra'

# Enable sessions for state management
enable :sessions

# Home page route
get '/' do
  erb :index
end

# Dynamic route with URL parameter
get '/greet/:name' do
  @name = params[:name]
  erb :greet
end

# Search route with query string
get '/search' do
  @query = params[:query]
  erb :search
end

# Form route to demonstrate GET and POST
get '/form' do
  erb :form
end

post '/form' do
  "You said '#{params[:message]}'"
end

# Error handling for 404 Not Found
not_found do
  'This is nowhere to be found.'
end

# Error handling for 500 Internal Server Error
error 500 do
  'Something went wrong on the server!'
end

# A simple helper method to demonstrate state with session
helpers do
  def set_counter
    session[:counter] ||= 0
    session[:counter] += 1
  end

  def get_counter
    session[:counter]
  end
end

__END__

@@ layout
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>My Ruby Website</title>
</head>
<body>
  <%= yield %>
</body>
</html>

@@ index
<h1>Welcome to My Ruby Website</h1>
<p>Visit <a href="/greet/World">Greeting Page</a> to get a personalized greeting.</p>
<p>Try submitting the <a href="/form">message form</a>.</p>
<p>Your visit count: <%= set_counter %></p>

@@ greet
<h1>Hello <%= @name %>!</h1>

@@ search
<h1>Search Results for '<%= @query %>'</h1>
<p>No results found. This is just a placeholder page.</p>

@@ form
<h1>Message Form</h1>
<form action="/form" method="post">
  <label for="message">Type your message here:</label>
  <input type="text" id="message" name="message">
  <input type="submit" value="Send">
</form>
