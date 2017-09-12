require 'sinatra'

def logRequest(request: nil)
  open('visitors.log', 'a') { |f|
    f.puts request.fullpath
    f.puts request.ip
    f.puts request.user_agent
    f.puts "\n\n"
  }
end

not_found do
  logRequest(request: request)
  "?"
end

get '/IMG_2177.jpg' do
  logRequest(request: request)
  send_file 'suitcaseTurtle.png'
end

get '/visitors.log' do
  send_file 'visitors.log'
end
