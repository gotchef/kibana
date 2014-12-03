#
# kibana::nginx

include_recipe 'aws-util::opsworks_hosts'

runit_service "nginx" do
  action :nothing # only define so that it can be restarted if the config changed
end

directory node['kibana']['nginx']['log_dir'] do
	mode '0755'
	owner node['kibana']['user']
	group node['kibana']['group']
	recursive true
end

config_path = 'kibana.conf'

es_layer = node['kibana']['layer']['elasticsearch']
node.normal['kibana']['nginx']['es_hosts'] = default[:stack][es_layer][:ips] 

template File.join(node['kibana']['nginx']['config_dir'], config_path) do
	cookbook node['kibana']['nginx']['cookbook']
	source  "kibana_nginx.conf.erb"
	owner node['kibana']['user']
	group node['kibana']['group']
	mode '0644'
	variables node['kibana']['nginx']
	notifies :restart, "runit_service[nginx]"
end


