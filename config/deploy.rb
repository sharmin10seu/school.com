require "rvm/capistrano"
require 'bundler/capistrano'
require 'whenever/capistrano'

# Multi stage environments
set :stages, %w(production staging)
require "capistrano/ext/multistage"

load 'deploy/assets'
set :assets_role, [:app]
set :rvm_ruby_string, '2.1.1'

set :whenever_command, "bundle exec whenever"
set :application, "school.com"
set :repository,  "git@github.com:Kindyapp/api.git"
set :deploy_to, "/home/deploy/rails-apps/kindy"

set :scm, :git
set :user, "ubuntu"
set :branch, "master"
set :deploy_via, :remote_cache
set :keep_releases, 10
set :use_sudo, true

ssh_options[:port] = 22
ssh_options[:forward_agent] = true
ssh_options[:verbose]
default_run_options[:pty] = true

set :unicorn_pid, "#{deploy_to}/shared/pids/unicorn.pid"