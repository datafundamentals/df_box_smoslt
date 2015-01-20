


docker_container "conceptnotfound/sonatype-nexus" do 
	container_name "nexus"
	detach true
	port "8081:8081"
	action :run
end

docker_container "jenkins" do 
	container_name "jenkins"
	# command "mkdir -p /var/jenkins_home/maven && curl -o /var/jenkins_home/maven/apache-maven-3.2.5-bin.tar.gz http://download.nextag.com/apache/maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.tar.gz && tar -xzvf /var/jenkins_home/maven/apache-maven-3.2.5-bin.tar.gz && rm -f /var/jenkins_home/maven/apache-maven-3.2.5-bin.tar.gz"
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
	force true
end
docker_container "conceptnotfound/sonatype-nexus" do 
	action :remove
	force true 
end

docker_container "jenkins" do 
	container_name "jenkins"
	detach true
	user "root"
	volume "/var/jenkins/jenkins_home/:/var/jenkins_home"
	port "8080:8080"
	action :run
end

docker_container "conceptnotfound/sonatype-nexus" do 
	container_name "nexus" 
	detach true
	volume "/var/nexus/:/nexus" 
	action :run 
end

docker_container "tutum/tomcat" do 
	container_name "tomcat" 
	detach true
	port "8082:8080"
	action :run 
end