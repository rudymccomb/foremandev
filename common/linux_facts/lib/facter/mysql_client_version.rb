Facter.add("mysql__client_version") do
  setcode do
    Facter::Util::Resolution.exec("/usr/bin/mysql --version | grep mysql | awk '{print $2,$3,$4,$5,$8}' ")
  end
end
