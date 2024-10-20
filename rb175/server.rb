require "socket"

server = TCPServer.new("localhost", 3003)

def parse_request(request_line)
  http_method, http_path, http_version = request_line.split
  path, params = http_path.split("?")
  params = (params || "").split("&").map {|param_string| param_string.split("=")}.to_h
  [http_method, path, params, http_version]
end

loop do
  client = server.accept #waits until someone requests something from the server and returns a client object

  request_line = client.gets #gets will retrieve the first line
  next if !request_line || request_line =~ /favicon/
  puts request_line

  next unless request_line
  
  http_method, path, params = parse_request(request_line)

  number_dice = params["number_dice"].to_i
  number_sides = params["sides"].to_i

  client.puts "HTTP/1.0 200 OK"
  client.puts "Content-Type: text/html"
  client.puts
  client.puts "<html>"
  client.puts "<body>"
  client.puts "<pre>"
  client.puts http_method
  client.puts path
  client.puts params
  client.puts "</pre>"


  #client.puts "HTTP/1.1 200 OK\r\n\r\n"
  #client.puts request_line

  # client.puts "<h1>Rolls!</h1>"
  # number_dice.times { 
  #   roll = rand(number_sides) + 1
  #   client.puts("<p>", roll, "</p>")
  # }

  client.puts "<h1>Counter</h1>"

  number = params["number"].to_i
  client.puts "<p>The current number is #{number}.</p>"
  client.puts "<a href='http://localhost:3003/?number=#{number-1}'>decrease by 1</a>"
  client.puts "<a href=\"http://localhost:3003/?number=#{number+1}\">increase by 1</a>"



  client.puts "</body>"
  client.puts "</html>"

  client.close
end

