#
# Cookbook Name:: 7dtd
# Attributes:: default
#
# Copyright 2016, Greg Fitzgerald.
#
# Licensed under the Apache License, Version 2.0 (the 'License');
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an 'AS IS' BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['7dtd']['user'] = '7dtd'
default['7dtd']['group'] = '7dtd'
default['7dtd']['install_dir'] = '/srv/7dtd'

default['7dtd']['steamcmd_url'] = 'http://media.steampowered.com/installer/steamcmd_linux.tar.gz'
default['7dtd']['checksum'] = 'c7e382f81d5a44036ebb21fd6aa77f68fb4ac0b6d6f4c209ef389b05eba0f9b8'

default['7dtd']['dependencies'] = %w(gcc rsync)
default['7dtd']['64bit_packages'] = %w(lib32gcc1)
