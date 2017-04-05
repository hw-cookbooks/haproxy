describe package('haproxy') do
  it { should be_installed }
end

describe directory '/etc/haproxy' do
  it { should exist }
end

describe file('/etc/haproxy/haproxy.cfg') do
  it { should exist }
  it { should be_owned_by 'haproxy' }
  it { should be_grouped_into 'haproxy' }
  its('content') { should match(%r{daemon}) }
  its('content') { should match(%r{timeout connect 5000ms}) }
  its('content') { should match(%r{listen http-in}) }
  its('content') { should match(%r{server1 127.0.0.1:8000 maxconn 32}) }
  its('content') { should match(%r{\*:80}) }
end