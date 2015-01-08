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


# template "/var/lib/backup.sh" do 
# 	source "backup.sh.erb"
# 	action :create
# end

docker_image "jenkins"

docker_image "busybox"

docker_image "conceptnotfound/sonatype-nexus"

# docker_image "tutum/tomcat"

docker_container "conceptnotfound/sonatype-nexus" do 
	container_name "nexus"
	detach true
	port "8081:8081"
	action :run
end

docker_container "jenkins" do 
	container_name "jenkins"
	detach true
	user "root"
	port "8080:8080"
	action :run

end

execute "sudo docker cp jenkins:/var/jenkins_home /var/jenkins" do 
	action :run
end

execute "sudo docker cp nexus:/nexus /var/nexus" do 
	action :run 
end

docker_container "jenkins" do 
	action :remove
end
docker_container "nexus" do 
	action :remove
end


execute "sudo docker run -d --name data -v /var/jenkins/jenkins_home:/var/jenkins_home -v /var/nexus/nexus:/nexus busybox true "
docker_container "jenkins" do 
	action :remove 
	end

docker_container "jenkins" do 
	container_name "jenkins"
	detach true
	volumes_from "data"
	action :run
end

docker_container "conceptnotfound/sonatype-nexus" do 
	container_name "nexus" 
	detach true
	volumes_from "data" 
	action :run 
end

include_recipe "df_box_smoslt::scripts" 
# docker_container "tutum/tomcat" do 
# 	detach true 
# 	port "8082:8080"
# 	volume "/var/tomcat:/tomcat/webapps/smoslt"
# 	action :run
# end
