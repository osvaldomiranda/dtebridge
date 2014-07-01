set :ip, "162.242.210.222"
server "#{ip}", :web, :app, :db, primary: true
set :rails_env, 'staging'