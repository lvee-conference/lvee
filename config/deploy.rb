require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rvm'

set :domain, '192.168.100.8'
set :deploy_to, '/home/alexandr/engine'
set :repository, 'https://github.com/lvee/lvee-engine.git'
set :branch, 'staging'
set :shared_paths, ['log/', 'tmp/', 'public/']
set :shared_files, ['config/database.yml']

set :user, 'alexandr'

set :rails_env, 'production'
#set :port, '22'
#set :ssh_options, '-A'

task :environment do
  invoke :'rvm:use', 'ruby-2.3.3@default'
end

task :deploy do
  deploy do
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    
  end
end
