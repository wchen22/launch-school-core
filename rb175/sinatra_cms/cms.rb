require "sinatra"
require "sinatra/reloader" if development?
require "sinatra/content_for"
require "tilt/erubis"
require "redcarpet"
require "yaml"
require 'bcrypt'

root = File.expand_path("..", __FILE__)

def data_path
  if ENV["RACK_ENV"] == "test"
    File.expand_path("../test/data", __FILE__)
  else
    File.expand_path("../data", __FILE__)
  end
end

def load_user_credentials
  credentials_path = if ENV["RACK_ENV"] == "test"
    File.expand_path("../test/users.yml", __FILE__)
  else
    File.expand_path("../users.yml", __FILE__)
  end
  YAML.load_file(credentials_path)
end

configure do
  enable :sessions
  set :session_secret, SecureRandom.hex(32)
end

before do
  pattern = File.join(data_path, "*")
  @files = Dir.glob(pattern).map do |path|
    File.basename(path)
  end
end

def create_document(name, content = "")
  File.open(File.join(data_path,name), "w") do |file|
    file.write(content)
  end
end

get "/" do
    erb :index, layout: :layout
end

get "/users/signin" do
  erb :signin, layout: :layout
end

def user_signed_in?
  session.key?(:username)
end

def require_signed_in_user
  unless user_signed_in?
    session[:message] = "You must be signed in to do that."
    redirect "/"
  end
end

def valid_credentials?(username, password)
  credentials = load_user_credentials

  if credentials.key?(username)
    bcrypt_password = BCrypt::Password.new(credentials[username])
    bcrypt_password == password
  else
    false
  end
end

post "/users/signin" do
  username = params[:username]

  if valid_credentials?(username, params[:password])
    session[:message] = "Welcome!"
    session[:username] = username
    redirect "/"
  else
    session[:message] = "Invalid credentials."
    status 422
    erb :signin, layout: :layout
  end
end

post "/users/signout" do
  session.delete(:username)
  session[:message] = "You have been signed out."
  redirect "/"
end

def render_markdown(text)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  markdown.render(text)
end

def load_file_content(path)
  content = File.read(path)
  case File.extname(path)
  when ".txt"
    headers["Content-Type"] = "text/plain"
    content
  when ".md"
    render_markdown(content)
  end
end

get "/new" do
require_signed_in_user

erb :new
end

get "/:filename" do
  file_path = File.join(data_path, params[:filename])

  if File.exist?(file_path)
    load_file_content(file_path)
  else
    session[:message] = "File #{params[:filename]} not found"
    redirect "/"
  end
end

get "/:filename/edit" do
  require_signed_in_user

  file_path = File.join(data_path, params[:filename])

  @filename = params[:filename]
  @content = File.read(file_path)

  erb :edit, layout: :layout
end

post "/new" do
  require_signed_in_user

  if params[:document_name].strip == ""
    session[:message] = "Document name cannot be blank"
    status 422
    erb :new, layout: :layout
  else
    create_document(params[:document_name], "")
    session[:message] = "#{params[:document_name]} has been created."
    redirect "/"
  end
end

post "/:filename" do
  require_signed_in_user

  file_path = File.join(data_path, params[:filename])

  File.write(file_path, params[:content])

  session[:message] = "#{params[:filename]} has been updated."
  redirect "/"
end

post "/:filename/delete" do
  require_signed_in_user

  File.delete(File.join(data_path, params[:filename]))
  session[:message] = "#{params[:filename]} has been deleted"
  redirect "/"
end

