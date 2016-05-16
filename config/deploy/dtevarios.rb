# El Sultan
set :ip, "45.56.74.195"

server "#{ip}", :web, :app, :db, primary: true
set :rails_env, 'production'
set :branch, "master"