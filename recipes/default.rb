#
# Cookbook Name:: kibana
# Recipe:: default
#
# Copyright (c) 2014 The Authors, All Rights Reserved.

include_recipe 'ark'

group node['kibana']['group'] do
end

user node['kibana']['user'] do
	comment 'Kibana Server'
	gid node['kibana']['group']
	home node['kibana']['base_dir']
	shell '/bin/bash'
	system true
end

directory node['kibana']['base_dir'] do
	mode '0755'
	owner node['kibana']['user']
	group node['kibana']['group']
	recursive true
end

ark 'kibana' do
	url node['kibana']['url']
	version node['kibana']['kibana3_version']
	checksum node['kibana']['checksum']
	path node['kibana']['base_dir']
	home_dir File.join(node['kibana']['base_dir'], 'current')
end

config_path = 'current/config.js'

template File.join(node['kibana']['base_dir'], config_path) do
	cookbook node['kibana']['config']['cookbook']
	source   node['kibana']['config']['source']
	owner node['kibana']['user']
	group node['kibana']['group']
	mode '0644'
	variables('es_port' => node['kibana']['elasticsearch']['port'])
end
