#
# Cookbook Name:: td-agent
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Add td-agent repository
cookbook_file "/etc/yum.repos.d/td.repo" do
	source "td.repo"
	mode 00644
end

# Install fluentd(td-agent)
package "td-agent" do
	action :install
end

directory "/var/log/fluent" do
	mode "00775"
	action :create
end

directory "/tmp/td-agent" do
	mode "00777"
end

service "td-agent" do
	supports :status => true, :restart => true, :reload => true
	action [ :enable, :start]
end
