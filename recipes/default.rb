#
# Cookbook Name:: yasm
# Recipe:: default
#
# Copyright (c) 2016, David Joos
#

case node['yasm']['install_method'].to_s
when 'source'
  include_recipe 'yasm::source'
when 'package'
  include_recipe 'yasm::package'
else
  raise NotImplementedError, "#{node['yasm']['install_method']} installation method is not implemented for yasm.install_method attribute"
end
