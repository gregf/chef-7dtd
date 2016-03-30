#
# Cookbook Name:: 7dtd
# Recipe:: default
#
# Copyright 2016, Greg Fitzgerald
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'systemd'
include_recipe '7dtd::user'

tar_name = tar_file(node['7dtd']['steamcmd_url'])

execute 'dpkg --add-architecture i386' do
  command 'dpkg --add-architecture i386'
  only_if { node['kernel']['machine'] == 'x86_64' }
  notifies :run, 'execute[apt-get update]', :immediately
end

execute 'apt-get update' do
  command 'apt-get update'
  action :nothing
end

package node['7dtd']['dependencies'] do
  action :install
end

package node['7dtd']['64bit_packages'] do
  action :install
  only_if { node['kernel']['machine'] == 'x86_64' }
end

remote_file "#{Chef::Config['file_cache_path']}/#{tar_name}" do
  source node['7dtd']['steamcmd_url']
  checksum node['7dtd']['checksum']
  owner node['7dtd']['user']
  group node['7dtd']['group']
  mode 0644
  action :create_if_missing
end

directory node['7dtd']['install_dir'] do
  recursive true
  owner node['7dtd']['user']
  group node['7dtd']['group']
  mode 0755
  action :create
end

directory "#{node['7dtd']['install_dir']}/steamcmd" do
  recursive true
  owner node['7dtd']['user']
  group node['7dtd']['group']
  mode 0755
  action :create
end

directory "#{node['7dtd']['install_dir']}/engine" do
  recursive true
  owner node['7dtd']['user']
  group node['7dtd']['group']
  mode 0755
  action :create
end

execute 'Extract steamcmd' do
  command "tar xf #{Chef::Config['file_cache_path']}/#{tar_name} -C #{node['7dtd']['install_dir']}/steamcmd"
  user node['7dtd']['user']
  group node['7dtd']['group']
end

execute 'steamcmd +quit' do
  cwd "#{node['7dtd']['install_dir']}/steamcmd"
  user node['7dtd']['user']
  group node['7dtd']['group']
  command './steamcmd.sh +quit'
  not_if { ::File.exist?("#{node['7dtd']['install_dir']}/steamcmd/steamcmd.sh") }
end

execute 'Install 7dtd Server' do
  cwd "#{node['7dtd']['install_dir']}/steamcmd"
  user node['7dtd']['user']
  group node['7dtd']['group']
  command "./steamcmd.sh +login anonymous +force_install_dir #{node['7dtd']['install_dir']}/engine +app_update 294420 validate +quit"
  not_if { ::File.exist?("#{node['7dtd']['install_dir']}/engine/7DaysToDieServer.x86_64") }
end

execute'Upgrade 7dtd Server' do
  cwd "#{node['7dtd']['install_dir']}/steamcmd"
  user node['7dtd']['user']
  group node['7dtd']['group']
  command "./steamcmd.sh +login anonymous +force_install_dir #{node['7dtd']['install_dir']}/engine +app_update 294420 validate +quit"
  only_if { node['7dtd']['auto_upgrade'] == true }
end

include_recipe '7dtd::service'

template "#{node['7dtd']['install_dir']}/engine/serverconfig.xml" do
  owner node['7dtd']['user']
  group node['7dtd']['group']
  mode 0644
  action :create
  variables(opt: node['7dtd']['serverconfig'])
  notifies :restart, 'systemd_service[7dtd]', :delayed
end
