require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get "/" do
  def format_link(filename)
    "<a href=#{filename}> #{filename} </a><br>"
  end

  sort_order = params[:sort] #asc, desc
  @files = Dir.glob("public/*").map {|file| File.basename(file)}.sort
  @files.reverse! if sort_order == "desc"
  erb :directory  

end

get '/list' do
  list = ["Apple", "Banana", "Cherry"]
  list.join("<br>")
end