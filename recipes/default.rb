#
# Cookbook Name:: df_box_smoslt
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

# include_recipe "df_box_smoslt::smoslt_app"

include_recipe "docker::default"

docker_image "jenkins"

docker_image "busybox"

docker_image "conceptnotfound/sonatype-nexus"

docker_image "tutum/tomcat"

include_recipe "df_box_smoslt::smoslt_app"

case node['df_box_smoslt']['data_container']
when true

include_recipe "df_box_smoslt::scripts" 

execute "./restart.sh" do 
	cwd '/scripts'
	action :run 
end

docker_container "tutum/tomcat" do 
	detach true
	port "8082:8080"
	action :run
end

else

include_recipe "df_box_smoslt::smoslt_chef"
end

