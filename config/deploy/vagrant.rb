# this doesn't work somehow
# VAGRANT = '10.10.0.1'
# use params from "vagrant ssh-config" command
VAGRANT = '127.0.0.1'

set :rails_env, :vagrant

# use params from "vagrant ssh-config" command
set :ssh_options, { port: 2222, keys: ['~/.vagrant.d/insecure_private_key'] }

role :web, VAGRANT
role :app, VAGRANT
role :db,  VAGRANT, :primary => true
