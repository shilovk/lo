# config valid for current version and patch releases of Capistrano
lock '~> 3.14.1'

set :unicorn_rack_env, 'production'
set :application, 'lo'
set :repo_url, 'git@github.com:shilovk/lo.git'

set :deploy_to, '/home/deployer/lo'
set :deploy_user, 'deployer'

set :keep_releases, 3

append :linked_files, 'config/database.yml', 'config/master.key'

append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system', 'storage', 'node_modules'

before 'deploy:updating'
after 'deploy:publishing', 'deploy:restart'

namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end
