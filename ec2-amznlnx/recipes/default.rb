#
# Cookbook Name:: ec2-amznlnx
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Set JP Local OS Timezone
cookbook_file "/etc/localtime" do
	source "Japan"
	owner "root"
	group "root"
	mode "0644"
end

# yum update
execute "yum-update" do
	user "root"
	command " yum -y update"
	action :run
end
