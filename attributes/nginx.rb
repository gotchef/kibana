
## NGINX

default['kibana']['nginx']['listen_http']  = 80
default['kibana']['nginx']['listen_https'] = 443
default['kibana']['nginx']['config_dir'] = '/etc/nginx/conf.d'
default['kibana']['nginx']['server_name'] = 'kibana'
default['kibana']['nginx']['logfile_name'] = 'kibana'
default['kibana']['nginx']['log_dir'] = '/var/log/nginx/kibana'
default['kibana']['nginx']['log_format'] = 'json'
default['kibana']['nginx']['root'] = node['kibana']['base_dir'] + "/current"
default['kibana']['nginx']['cookbook'] = 'kibana'

default['kibana']['nginx']['client_max_body'] = '50M'

default['kibana']['nginx']['auth'] = false
default['kibana']['nginx']['auth_file'] = '/etc/nginx/htpasswd.users'

default['kibana']['nginx']['ssl'] = false
default['kibana']['nginx']['ssl_certificate']     = nil #path
default['kibana']['nginx']['ssl_certificate_key'] = nil #path
default['kibana']['nginx']['ssl_protocols']       = 'TLSv1 TLSv1.1 TLSv1.2'
default['kibana']['nginx']['ssl_ciphers']         = 'ECDHE-RSA-RC4-SHA:ECDHE-RSA-AES128-SHA:AES256-CGM-SHA256:ECDHE-RSA-AES256-SHA256:RC4:HIGH:!aNULL:!MD5:-LOW:-SSLv2:-EXP'
default['kibana']['nginx']['ssl_session_cache']   = 'shared:SSL:10m'
default['kibana']['nginx']['ssl_session_timeout'] = '10m'
default['kibana']['nginx']['es_hosts'] = ['127.0.0.1']

default['kibana']['layer']['elasticsearch'] = 'elasticsearch-master'



