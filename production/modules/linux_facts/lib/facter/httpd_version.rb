Facter.add("httpd_version") do
  setcode do
    Facter::Util::Resolution.exec("/usr/sbin/httpd -version |  grep Apache | awk '{print $3}'")
  end
end
