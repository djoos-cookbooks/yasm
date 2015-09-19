#
# Cookbook Name:: yasm
# Recipe:: source
#
# Copyright 2012-2014, Escape Studios
#

include_recipe 'build-essential'
include_recipe 'git'

yasm_packages.each do |pkg|
  package pkg do
    action :purge
  end
end

creates_yasm = "#{node['yasm']['prefix']}/bin/yasm"

file creates_yasm do
  action :nothing
end

git node['yasm']['build_dir'] do
  repository node['yasm']['git_repository']
  reference node['yasm']['git_revision']
  action :sync
  notifies :delete, "file[#{creates_yasm}]", :immediately
end

# write the flags used to compile to disk
template "#{node['yasm']['build_dir']}/yasm-compiled_with_flags" do
  source 'compiled_with_flags.erb'
  owner 'root'
  group 'root'
  mode 0600
  variables(
    :compile_flags => node['yasm']['compile_flags']
  )
  notifies :delete, "file[#{creates_yasm}]", :immediately
end

bash 'compile_yasm' do
  cwd node['yasm']['build_dir']
  code <<-EOH
    autoreconf
    automake --add-missing
    ./configure --prefix=#{node['yasm']['prefix']} #{node['yasm']['compile_flags'].join(' ')}
    make clean && make && make install
  EOH
  not_if { ::File.exists?(creates_yasm) }
end
