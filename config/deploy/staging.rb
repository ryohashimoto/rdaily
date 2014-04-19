role :app, %w{vagrant@vagrant01}
role :web, %w{vagrant@vagrant01}
role :db,  %w{vagrant@vagrant01}

server 'vagrant01', user: 'vagrant', roles: %w{app web db}

set :ssh_options, {
  user: 'vagrant',
  keys: ["/Users/ryo/.vagrant.d/insecure_private_key"],
  auth_methods: ["publickey"]
}

