#
# Cookbook Name:: awslog-agent
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

remote_url ="#{node["awslog-agent"]["wget_url"]}"
installer ="#{node["awslog-agent"]["installer"]}"

# Download installer py file
remote_file "/tmp/#{installer}" do
	source "#{remote_url}#{installer}"
	mode "0755"
end

# Prepare awslogs.conf file
template "/tmp/awslogs.conf" do
	source "awslogs.conf.erb"
	group "root"
	owner "root"
	mode "0500"
end

# Execute Setup py
execute "awslog-agent" do
	command "/tmp/awslogs-agent-setup-v1.0.py -n -r us-east-1 -c /tmp/awslogs.conf"
end

service "awslogs" do
	supports :status=>true, :restart=>true, :reload=>true
	action [ :enable, :start]
end
