#
default['kibana']['version'] = '3'
default['kibana']['kibana3_version'] = '3.1.2'
default['kibana']['base_dir'] = '/srv/kibana'
default['kibana']['user'] = 'kibana'
default['kibana']['group'] = 'kibana'
default['kibana']['url'] = "https://download.elasticsearch.org/kibana/kibana/kibana-#{node['kibana']['kibana3_version']}.tar.gz"
default['kibana']['checksum'] = 'df25bc0cc02385edcac446ef8cbd83b896cdc910a0fa1b0a7bd2a958164593a8'

#default['kibana']['interface'] = node['ipaddress']
default['kibana']['port'] = 4222

default['kibana']['elasticsearch']['hosts'] = ['127.0.0.1']
default['kibana']['elasticsearch']['port'] = 9200

default['kibana']['default_fields'] = '["@message"]'
default['kibana']['default_operator'] = 'OR'
default['kibana']['config']['cookbook'] = 'kibana'
default['kibana']['config']['source'] = 'config.js.erb'

#<> Fields specifiers which default to @message (may need to be changed for newer logstash)
default['kibana']['highlighted_field'] = '@message'
default['kibana']['primary_field'] = '@message'
default['kibana']['default_index'] = '@message'


