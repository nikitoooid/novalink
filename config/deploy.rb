# config valid for current version and patch releases of Capistrano
lock "~> 3.19.1"

set :application, "novalink"
set :repo_url, "git@github.com:nikitoooid/novalink.git"

set :deploy_to, "/home/deploy/#{fetch :application}"

set :branch, 'main'

set :rbenv_type, :user
set :rbenv_ruby, '2.7.2'

append :linked_files, 'config/database.yml', 'config/master.key'
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system', 'public/uploads'

set :keep_releases, 5
