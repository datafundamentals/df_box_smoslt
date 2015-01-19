directory "/var/nexus" do
	mode "0777"
	recursive true
	action :create
end

directory "/var/jenkins" do 
	mode "0777"
	action :create
end
