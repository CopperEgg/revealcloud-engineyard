#
# Cookbook Name:: copperegg-engineyard
# Recipe:: default
#
# Copyright 2012, CopperEgg
#
# Redistribution Encouraged
#

script "revealcloud_install" do
	interpreter "bash"
	cwd
	user "root"
	code <<-EOH
    curl -s http://#{node[:copperegg][:apikey]}@api.copperegg.com/rc.sh > /tmp/revealcloud.sh
    chmod +x /tmp/revealcloud.sh
    export RC_TAG="#{node[:copperegg][:tags] || ''}"
    export RC_LABEL="#{node[:copperegg][:label] || ''}"
    export RC_PROXY="#{node[:copperegg][:proxy] || ''}"
    export RC_OOM_PROTECT="#{node[:copperegg][:oom_protect] || ''}"
		export RC_UUID="#{node[:copperegg][:override_uuid] || ''}"
		/tmp/revealcloud.sh
	EOH
end
