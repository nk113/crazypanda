Readme
======

## Getting started

You can run this appliation in your local as usual - using [rvm](http://rvm.io/) or [rbenv](https://github.com/sstephenson/rbenv) is recommended.

```sh
git clone git://github.com/nk113/crazypanda.git
gem install bundler
bundle install
rake db:migrate
rails server
```

### locomotive-chef-repo

Follow installation and deployment instruction of [locomotive-chef-repo](https://github.com/intercity/locomotive-chef-repo). The destination directory for this clone should be separated from this ```crazymanda``` git clone.

### Working with Vagrant

Note that **Vagrantfile** here expects the clone of the [locomotive-chef-repo](https://github.com/intercity/locomotive-chef-repo) to be alongside in the same directory as ```crazymanda``` clone with ```chef-repo``` as the directory name. You can, of course, edit **Vagrantfile** or setup new vagrant environment as you like though.

```sh
vagrant up
```

Then follow the deployment instruction of [locomotive-chef-repo](https://github.\
com/intercity/locomotive-chef-repo), you should be able to see something cool accessing ```http://localhost:8080``` with your browser.
