#
# Cookbook Name:: awslog-agent
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Install AWS CloudWatchLogs Agent
package "awslogs" do
	action :install
end

# Prepare awsxcli.conf file
template "/etc/awslogs/awscli.conf" do
	source "awscli.conf.erb"
	group "root"
	owner "root"
	mode "0500"
end


service "awslogs" do
	supports :status=>true, :restart=>true, :reload=>true
	action [ :enable, :start]
end
