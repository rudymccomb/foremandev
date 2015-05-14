Facter.add("php_rpm_version") do
  setcode do
    Facter::Util::Resolution.exec("/bin/rpm -qa --queryformat '%{VERSION}-%{RELEASE}' php")
  end
end
