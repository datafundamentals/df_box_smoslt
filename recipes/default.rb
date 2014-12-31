#
# Cookbook Name:: df_box_smoslt
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "df_box_smoslt::smoslt_app"

include_recipe "docker::default"


template "/var/lib/backup.sh" do 
	source "backup.sh.erb"
	action :create
end

directory "/home/vagrant/nexus" do 
	action :create
	recursive true 
end

directory "/home/vagrant/jenkins" do 
	action :create
	recursive true
end

docker_image "jenkins"

docker_image "busybox"

docker_image "conceptnotfound/sonatype-nexus"

docker_image "tutum/tomcat"

docker_container "conceptnotfound/sonatype-nexus" do 
	detach true
	port "8081:8081" 
	action :run
end

docker_container "jenkins" do 
	detach true
	user "root"
	port "8080:8080"
	action :run
	command "apt-get install -y maven"
end

docker_container "jenkins" do
	action :commit
end

docker_container "tutum/tomcat" do 
	detach true 
	port "8082:8080"
	volume "/var/tomcat:/tomcat/webapps/smoslt"
	action :run
end
