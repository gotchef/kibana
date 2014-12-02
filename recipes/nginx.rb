

directory node['kibana']['nginx']['log_dir'] do
	mode '0755'
	owner node['kibana']['user']
	group node['kibana']['group']
	recursive true
end

config_path = 'kibana.conf'

template File.join(node['kibana']['nginx']['config_dir'], config_path) do
	cookbook node['kibana']['config']['cookbook']
	source   node['kibana']['config']['source']
	owner node['kibana']['user']
	group node['kibana']['group']
	mode '0644'
	variables(node['kibana']['nginx'])
end


