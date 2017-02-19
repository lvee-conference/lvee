require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rvm'

set :domain, 'lvee.org'
set :deploy_to, "/home/lvee/engine"
set :repository, 'https://github.com/lvee/lvee-engine.git'
set :app_path,   "#{fetch(:current_path)}"
set :branch, 'master'
set :shared_paths, ['log/', 'tmp/', 'public/']
set :shared_files, ["config/database.yml"]
set :user, 'lvee'
#set :rails_env, 'production'
#set :port, '22'
#set :ssh_options, '-A'

task :environment do
	#queue "echo 'test'"
  #command "cat #{fetch(:app_path)}/.ruby-version"
  invoke :'rvm:use', 'ruby-2.3.3@default'
end

task :deploy do
  deploy do
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    command "#{fetch (:bundle_prefix)} rake bootstrap"
   invoke :'rails:assets_precompile'
  end
end
