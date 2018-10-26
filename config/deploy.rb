set :application, "rdaily"
set :repo_url, "git@github.com:ryohashimoto/rdaily.git"

set :branch, "master"

set :deploy_to, "/var/www/rdaily"

set :scm, :git

set :user, "ops"
set :rbenv_type, :system
set :rbenv_ruby, "2.1.3"
set :rbenv_path, "/usr/local/rbenv"

set :linked_dirs, (fetch(:linked_dirs) + ["tmp/pids"])

set :default_env, {
  rbenv_root: "/usr/local/rbenv",
  path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH"
}

set :keep_releases, 5

set :unicorn_rack_env, "none"
set :unicorn_config_path, "config/unicorn.rb"

after "deploy:publishing", "deploy:restart"
namespace :deploy do
  task :restart do
    invoke "unicorn:restart"
  end
end
