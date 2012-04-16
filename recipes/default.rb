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
  notifies :restart, 'service[netatalk]'
end
