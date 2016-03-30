# 7dtd
[![Build Status](https://travis-ci.org/gregf/chef-7dtd.svg?branch=master)](https://travis-ci.org/gregf/chef-7dtd)
[![Cookbook Version](https://img.shields.io/cookbook/v/7dtd.svg)](https://supermarket.chef.io/cookbooks/7dtd)

## Description

Installs and configures a [7dtd](http://www.7dtd.net) server.

* Opscode Community Site: http://community.opscode.com/cookbooks/7dtd
* Source Code: http://github.com/gregf/cookbook-7dtd

## Requirements

### Chef

Tested on chef 11

### Cookbooks

* [systemd](https://supermarket.chef.io/cookbooks/systemd)

### Platforms

* Debian 8+
* Ubuntu 15.04+

## Recipes

### default

The default recipe ensures a 7dtd server is installed, and configured based on
attributes you have specified.

### user

The user recipe is called by default, and creates a new user/group `7dtd` for
the server to run as.

### service

The service recipe enables the systemd service for 7dtd.

## Attributes

### Default

* `7dtd['user']`
  - The user the 7dtd server runs under, default `mcserver`

* `7dtd['group']`
  - The group the 7dtd server runs under, default `mcserver`

* `7dtd['install_dir']`
  - The default location 7dtd is installed to, default `/srv/7dtd`

* `7dtd['steamcmd_url']`
  - The url to fetch steamcmd releases from, default
    `https://s3.amazonaws.com/7dtd.Download/versions`

* `7dtd['checksum']`
  - The sha256 checksum of 7dtd_server.jar

### ServerConfig

You can can customize any of the settings from serverconfig.xml. They are kept
up to date with upstream and you can read about each setting in more detail
[here](http://7daystodie.gamepedia.com/Server:_serverconfig.xml)

## Contributing

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Added some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

## License

Author: Greg Fitzgerald <greg@gregf.org>

Copyright 2016, Greg Fitzgerald.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
