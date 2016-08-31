name 'yasm'
maintainer 'David Joos'
maintainer_email 'development@davidjoos.com'
license 'MIT'
description 'Installs/Configures Yasm'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.1.0'

%w(debian ubuntu centos redhat fedora scientific amazon).each do |os|
  supports os
end

source_url 'https://github.com/djoos-cookbooks/yasm' if respond_to?(:source_url)
issues_url 'https://github.com/djoos-cookbooks/yasm/issues' if respond_to?(:issues_url)

depends 'build-essential'
depends 'git'

recipe 'yasm', 'Installs Yasm.'
recipe 'yasm::package', 'Installs Yasm using packages.'
recipe 'yasm::source', 'Installs Yasm from source.'
