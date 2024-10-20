require "sinatra"
require "sinatra/reloader" if development?
require "tilt/erubis"
require "yaml"

# next: save the yaml file, start building routes and test to make sure pages load

before do
  @user_info = YAML.load_file("users.yaml")
end

get "/" do
  redirect "/users/"
end

get "/users/" do
  @usernames = @user_info.keys
  erb :users
end

get "/users/:user" do
  @username = params[:user]
  @info = @user_info[@username.to_sym]
  erb :user_page
end

helpers do
  def other_user_links(user)
    @user_info.select{|key,value| key!=user.to_sym}.map {|key, value|key.to_s}
  end

  def count_interests
    number_users = @user_info.count
    number_interests = @user_info.map {|user, info| info[:interests].count}.sum
    "There are #{number_users} users with a total of #{number_interests} interests"
  end
end