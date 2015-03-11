#
# Cookbook Name:: zabbix-agent
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

repo_url = "#{node['zabbix-agent']['repo_url']}"
repo_package = "#{node['zabbix-agent']['repo_package']}"

# Install Zabbix RPM Repo if not installed
bash 'Add Zabbix RPM Repo' do
	user 'root'
	not_if "rpm -qa | grep -q #{repo_package}"
	code <<-EOC
		rpm -ivh #{repo_url}#{repo_package}.rpm
	EOC
end

# Install Zabbix-agent
package "zabbix-agent" do
	action :install
end

