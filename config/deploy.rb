require 'bundler/capistrano'
require 'capistrano/ext/multistage'

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set :application, 'crazypanda'
set :stages, %w(vagrant staging production)
set :scm, :git
set :repository,  'https://github.com/nk113/crazypanda.git'
set :default_stage, 'vagrant'
set :use_sudo, false
set :keep_releases, 5
set :deploy_to, defer { "/u/apps/#{application}_#{stage}" }

before "deploy:finalize_update" do
  run "rm -f #{release_path}/config/database.yml; ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  run "mkdir -p #{release_path}/tmp"
  run "ln -nfs #{shared_path}/sockets #{release_path}/tmp/sockets"
end

namespace :deploy do
  task :start do
    run "sudo bluepill load /etc/bluepill/#{application}_#{stage}.pill"
  end
  task :stop do
    run "sudo bluepill #{application}_#{stage} stop"
  end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "sudo bluepill #{application}_#{stage} restart"
  end
  task :status do
    run "sudo bluepill #{application}_#{stage} status"
  end
end
