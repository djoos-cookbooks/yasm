name 'yasm'
maintainer 'David Joos'
maintainer_email 'development@davidjoos.com'
license 'MIT'
description 'Installs/Configures Yasm'
version '1.2.0'

%w(debian ubuntu centos redhat fedora scientific amazon).each do |os|
  supports os
end

depends 'build-essential'
depends 'git'

source_url 'https://github.com/djoos-cookbooks/yasm'
issues_url 'https://github.com/djoos-cookbooks/yasm/issues'
