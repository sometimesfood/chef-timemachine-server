#
# Cookbook Name:: chef-timemachine-server
# Recipe:: default
#
# Copyright (c) 2012 Sebastian Boehm. See LICENSE for details.
#

package 'netatalk'
package 'avahi-daemon'

%w(netatalk avahi-daemon).each do |s|
  service s do
    supports :restart => true
    action :nothing
  end
end

cookbook_file '/etc/avahi/services/afpd.service' do
  mode '644'
  notifies :restart, 'service[avahi-daemon]'
end

template '/etc/netatalk/AppleVolumes.default' do
  mode '644'
  notifies :restart, 'service[netatalk]'
end

node[:timemachine_server][:timemachine_user_homedirs].each do |tm_user, dir|
  tm_user_group = 'nogroup'
  tm_user_gid = node[:etc][:group][tm_user_group][:gid]

  user tm_user do
    comment 'TimeMachine user'
    shell '/bin/false'
    home dir
    gid tm_user_gid
    system true
  end
  directory dir do
    action :create
    recursive true
    owner tm_user
    group tm_user_group
    mode '700'
  end
end
