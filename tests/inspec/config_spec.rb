# Test ntp config

ntp_configfile = '/etc/ntp.conf'

control 'config-01' do
  impact 1.0
  title 'Ntp server'
  desc 'Ntp worldwide servers should be present'
  describe file(ntp_configfile) do
     its('owner') { should eq 'root' }
     its('mode') { should cmp '0644' }
     its('content') { should match /server 0.pool.ntp.org iburst/ }
     its('content') { should match /server 1.pool.ntp.org iburst/ }
     its('content') { should match /server 2.pool.ntp.org iburst/ }
     its('content') { should match /server 3.pool.ntp.org iburst/ }
  end
end
