set :repo_url, 'git@github.com:DawidCwiek/PKZ.git'

set :stages,       %w(production)

set :linked_files, %w(config/database.yml config/master.key)

set :linked_dirs,  %w(log vendor/bundle tmp/sockets tmp/pids tmp/cache)

set :keep_releases, 5