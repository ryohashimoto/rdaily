set :application, 'rdaily'

set :scm, :git
set :repo_url, 'git@github.com:ryohashimoto/rdaily.git'
set :branch, 'master'
set :deploy_to, "$HOME/#{fetch(:application)}"
set :deploy_via, :remote_cache
set :keep_releases, 5

set :bundle_cmd, "$HOME/.rbenv/shims/bundle"

set :format, :pretty
set :log_level, :debug

set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

namespace :deploy do
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end
end
after 'deploy:publishing', 'deploy:restart'
