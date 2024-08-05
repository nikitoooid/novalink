# config valid for current version and patch releases of Capistrano
lock "~> 3.19.1"

set :application, "novalink"
set :repo_url, "git@github.com:nikitoooid/novalink.git"

set :deploy_to, "/home/deploy/#{fetch :application}"

set :branch, 'main'

set :rbenv_type, :user
set :rbenv_ruby, '2.7.2'

append :linked_files, 'config/database.yml', 'config/master.key'
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads'

set :keep_releases, 5

namespace :deploy do
  desc 'Ensure the current directory is a symlink'
  task :ensure_symlink do
    on roles(:app) do
      execute :rm, '-rf', release_path.join('current')
      execute :ln, '-s', release_path, release_path.join('current')
    end
  end
end

after 'deploy:symlink:release', 'deploy:ensure_symlink'
