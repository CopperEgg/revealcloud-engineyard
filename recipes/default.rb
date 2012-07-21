#
# Cookbook Name:: copperegg-engineyard
# Recipe:: default
#
# Copyright 2012, CopperEgg
#
# Redistribution Encouraged
#


template "/etc/init.d/revealcloud" do
	source "revealcloud.initd.erb"
	owner 'root'
	group 'root'
	mode 0755
	variables({
			:apikey => node[:copperegg][:apikey],
			:tags => node[:copperegg][:tags],
			:label => node[:copperegg][:label],
			:proxy => node[:copperegg][:proxy],
			:oom_protect => node[:copperegg][:oom_protect],
			:override_uuid => node[:copperegg][:override_uuid]
	})
end

template "/usr/bin/revealcloud.sh" do
	source "revealcloud.script.erb"
	owner 'root'
	group 'root'
	mode 0755
	variables({
			:apikey => node[:copperegg][:apikey],
			:tags => node[:copperegg][:tags],
			:label => node[:copperegg][:label],
			:proxy => node[:copperegg][:proxy],
			:oom_protect => node[:copperegg][:oom_protect],
			:override_uuid => node[:copperegg][:override_uuid]
	})
end

remote_file "/tmp/eyinstall.script" do 
  owner "root" 
  group "root" 
  mode 0755 
  source "eyinstall.script" 
  backup false 
  action :create 
end


script "revealcloud_install" do
    interpreter "bash"
    cwd
    user "root"
    code <<-EOH
    curl -s http://#{node[:copperegg][:apikey]}@api.copperegg.com/rc.sh | sed -n '1,33 p' > /tmp/eyinstall.sh
	cat /tmp/eyinstall.script >> /tmp/eyinstall.sh
    chmod +x /tmp/eyinstall.sh
    export RC_TAG="#{node[:copperegg][:tags] || ''}"
    export RC_LABEL="#{node[:copperegg][:label] || ''}"
    export RC_PROXY="#{node[:copperegg][:proxy] || ''}"
    export RC_OOM_PROTECT="#{node[:copperegg][:oom_protect] || ''}"
	export RC_UUID="#{node[:copperegg][:override_uuid] || ''}"
	/tmp/eyinstall.sh
    EOH
end


template "/etc/monit.d/revealcloud.monitrc" do
	source "revealcloud.monitrc.erb"
	owner 'root'
	group 'root'
	mode 0644
end

execute "monit reload" do
	action :run
end
