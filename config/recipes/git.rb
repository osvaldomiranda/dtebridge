namespace :git do
  desc "Install git"
  task :install do
    run "#{sudo} apt-get install git-core"
  end
end
