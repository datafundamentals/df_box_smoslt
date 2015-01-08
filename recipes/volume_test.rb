include_recipe "df_box_smoslt::smoslt_app"

include_recipe "docker::default"

docker_image "busybox"
docker_image "jenkins" 

docker_container "jenkins" do 
	container_name "jenkins"
	detach true
	user "root"
	port "8080:8080"
	action :run
end

# execute "sudo docker cp jenkins:/var/jenkins_home /var/jenkins" do 
# 	action :run
# end

docker_container "jenkins" do 
	source "/var/jenkins_home"
	destination "/home/vagrant"
	action :cp
end

# docker_container "jenkins" do 
# 	action :remove
# end


# docker_container "busybox" do
# 	detach true
# 	container_name "data"
# 	volume "/var/jenkins/jenkins_home:/var/jenkins_home"
# 	volume "/var/nexus/:/nexus"
# end

# docker_container "jenkins" do 
# 	container_name "jenkins"
# 	user "root"
# 	detach true
# 	port "8080:8080"
# 	volumes_from "data"
# 	action :run
# end
