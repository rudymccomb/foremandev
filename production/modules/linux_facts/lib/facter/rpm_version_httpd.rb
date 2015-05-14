Facter.add("rpm_version_httpd") do
  setcode do
    Facter::Util::Resolution.exec("/bin/rpm -q httpd")
  end
end
