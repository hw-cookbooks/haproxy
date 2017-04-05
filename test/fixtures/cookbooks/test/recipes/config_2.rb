haproxy 'package'

haproxy_config_global 'global' do
  daemon true
  maxconn 256
end

haproxy_config_defaults 'defaults' do
  mode 'http'
  timeout {
    connect: '500ms',
    client: '5000ms',
    server: '5000ms'
  }
end

haproxy_frontend 'http-in' do
  bind '*:80'
  default_backend 'servers'
end

haproxy_backend 'servers' do
  server 'server1 127.0.0.1:8000 maxconn 32'
end