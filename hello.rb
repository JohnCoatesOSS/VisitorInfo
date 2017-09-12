require 'sinatra'

not_found do
  "?"
end

get '/IMG_2177.jpg' do
  open('visitors.log', 'a') { |f|
    f.puts request.ip
    f.puts request.user_agent
    f.puts "\n\n"

  }
  send_file 'suitcaseTurtle.png'
end
