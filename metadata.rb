maintainer        'Greg Fitzgerald'
maintainer_email  'greg@gregf.org'
license           'Apache 2'
description       'Installs/Configures the 7 Days To Die server'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '0.1'
name              '7dtd'

recipe '7dtd', 'Installs and configures 7dtd Server'

%w(systemd apt).each do |dep|
  depends dep
end

%w(debian ubuntu).each do |os|
  supports os
end
