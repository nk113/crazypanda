# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'open-uri'
require 'openssl'

PROJECT_NAME = 'crazypanda'

BOX = 'precise64'
BOX_URL = 'http://files.vagrantup.com/precise64.box'
INSECURE_PUBLIC_KEY = open('https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub',
                           :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).read
CHEF_REPO_PATH = '../chef-repo'
COOKBOOKS_PATH = ["#{CHEF_REPO_PATH}/cookbooks", 'site-cookbooks',]
ROLES_PATH = "#{CHEF_REPO_PATH}/roles"

Vagrant.configure('2') do |config|
  config.vm.box = BOX
  config.vm.box_url = 'http://files.vagrantup.com/precise64.box'

  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 3306, host: 3306
  config.vm.network :private_network, ip: '10.10.0.1'

  # chef later than 11.0.0 is required to get apt cookbook to work in vagrant
  config.vm.provision :shell, :inline => 'gem install chef --version 11.4.2 --no-rdoc --no-ri --conservative'

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = COOKBOOKS_PATH
    chef.roles_path = ROLES_PATH

    chef.add_role 'vagrant'
    chef.add_role 'mysql'
    chef.add_role 'rails'

    chef.add_recipe 'rbenv::vagrant'
    chef.add_recipe 'rbenv::user'

    chef.json = {
      :authorization => {
        :sudo => {
          :include_sudoers_d => true,
          :users => ['vagrant',],
          :passwordless => true,
        }
      },
      :ssh_deploy_keys => [INSECURE_PUBLIC_KEY,],
      :rbenv => {
        :user_installs => [
          {
            :user => 'deploy',
            :rubies => ['2.0.0-p195',],
            :global => '2.0.0-p195',
            :gems => {
              '2.0.0-p195' => [
                {'name' => 'bundler'},
                # {'name' => 'rake'},
              ],
            },
          },
        ],
      },
      :mysql => {
        :server_root_password => '',
        :server_repl_password => '',
        :server_debian_password => '',
        :allow_remote_root => true,
      },
      :vagrant => { # chef will fail if this won't be provided
      },
      :deploy_users => ['vagrant',],
      :active_applications => {
        "#{PROJECT_NAME}_vagrant" => {
          :domain_names => ['localhost',],
          :packages => ['libpq-dev', 'nodejs',],
          :rails_env => 'vagrant',
          :deploy_user => 'vagrant',
          :database_info => {
            :adapter => 'mysql2',
            :username => 'vagrant',
            :password => '',
            :database => "#{PROJECT_NAME}_vagrant",
            :client_addresses => '10.10.*'
          }
        }
      },
    }
  end
end
