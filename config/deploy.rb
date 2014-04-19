set :application, 'rdaily'

set :scm, :git
set :repo_url, 'git@github.com:ryohashimoto/rdaily.git'
set :branch, 'master'
set :deploy_to, "/var/www/#{fetch(:application)}"
set :deploy_via, :remote_cache
set :keep_releases, 5

set :format, :pretty
set :log_level, :debug

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

namespace :deploy do
  after :publishing, :restart
  task :restart do
    invoke 'unicorn:restart'
  end

  after :finishing, :cleanup
end
