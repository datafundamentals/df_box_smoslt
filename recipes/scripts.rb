directory "/scripts" do 
	mode "0777" 
	action :create
end

template "/scripts/backup.sh" do 
	source "backup.sh.erb"
	mode "0777"
	action :create 
end
template "/scripts/load.sh" do 
	source "load.sh.erb"
	mode "0777"
	action :create
end
template "/scripts/restart.sh" do 
	source "restart.sh.erb" 
	mode "0777"
	action :create
end
template "/scripts/restore.sh" do 
	source "restore.sh.erb"
	mode "0777"
	action :create
end
template "/scripts/start.sh" do 
	source "start.sh.erb"
	mode "0777"
	action :create
end