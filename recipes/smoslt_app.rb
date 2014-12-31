directory "/var/tomcat/app" do 
	recursive true
	action :create 
	end

directory "/var/nexus" do 
	recursive true
	action :create
end

directory "/var/jenkins" do 
	action :create
end
