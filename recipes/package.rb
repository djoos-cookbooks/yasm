#
# Cookbook Name:: yasm
# Recipe:: package
#
# Copyright (c) 2016, David Joos
#

yasm_packages.each do |pkg|
  package pkg do
    action :upgrade
  end
end
