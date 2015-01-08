template "/home/vagrant/backup.sh" do 
	source "backup.sh.erb"
	mode "0777"
	action :create 
end
template "/home/vagrant/load.sh" do 
	source "load.sh.erb"
	mode "0777"
	action :create
end
template "/home/vagrant/restart.sh" do 
	source "restart.sh.erb" 
	mode "0777"
	action :create
end
template "/home/vagrant/restore.sh" do 
	source "restore.sh.erb"
	mode "0777"
	action :create
end
template "/home/vagrant/start.sh" do 
	source "start.sh.erb"
	mode "0777"
	action :create
end