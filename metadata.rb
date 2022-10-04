name 'yasm'
maintainer 'David Joos'
maintainer_email 'development@davidjoos.com'
license 'MIT'
description 'Installs/Configures Yasm'
version '1.2.1'

%w(debian ubuntu centos redhat fedora scientific amazon).each do |os|
  supports os
end

depends 'build-essential'
depends 'git'

source_url 'https://github.com/djoos-cookbooks/yasm' if respond_to?(:source_url)
issues_url 'https://github.com/djoos-cookbooks/yasm/issues' if respond_to?(:issues_url)
