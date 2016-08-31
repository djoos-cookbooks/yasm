#
# Cookbook Name:: yasm
# Recipe:: default
#
# Copyright (c) 2016, David Joos
#

case node['yasm']['install_method']
when :source
  include_recipe 'yasm::source'
when :package
  include_recipe 'yasm::package'
end
