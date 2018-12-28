# Test ntp daemon install

ntp_package = "ntp"
ntp_service = "ntpd"
ntp_service = "ntp" if os.family == "debian"

control 'install-01' do
  impact 1.0
  title 'Ntp package'
  desc 'Ntp daemon package should be install'
  describe package(ntp_package) do
    it { should be_installed }
  end
end

control 'install-02' do
  impact 1.0
  title 'Ntp service'
  desc 'Ntp service should be enabled and started'
  describe service(ntp_service) do
    it { should be_enabled }
    it { should be_running }
  end
end
