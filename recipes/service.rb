#
# Cookbook Name:: 7dtd
# Recipe:: service
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

systemd_socket '7dtd' do
  description '7dtd Socket'
  conflicts '7dtd.service'
  install do
    wanted_by 'sockets.target'
  end
  socket do
    listen_stream node['7dtd']['serverconfig']['serverport']
    accept true
  end
  action [:create, :enable, :start]
end

systemd_service '7dtd' do
  description '7dtd Server'
  after %w( network.target remote-fs.target nss-lookup.target )
  install do
    wanted_by 'multi-user.target'
  end
  service do
    exec_start "#{node['7dtd']['install_dir']}/engine/startserver.sh -configfile=serverconfig.xml"
    exec_reload '/bin/kill -HUP $MAINPID'
    kill_mode 'process'
    restart 'on-failure'
    restart_sec '30s'
    private_tmp true
    user node['7dtd']['user']
    group node['7dtd']['group']
  end
  only_if { ::File.open('/proc/1/comm').gets.chomp == 'systemd' } # systemd
end

service '7dtd' do
  action [:enable, :start]
end
