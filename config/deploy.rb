# config valid only for current version of Capistrano
lock "3.9.0"
set :application, "gallery"
set :repo_url, "git@github.com:timlentse/gallery.git"

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "~/gallery"

append :linked_files, 'config/application.yml', 'db/production.sqlite3'

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

after :deploy, :restart_server do
  on roles(:web), in: :groups, limit: 3, wait: 10 do
    within release_path do
      execute :bundle, 'exec rails restart'
    end
  end
end
