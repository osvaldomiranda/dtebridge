set :ip, "162.242.209.82"
server "#{ip}", :web, :app, :db, primary: true
set :rails_env, 'production'