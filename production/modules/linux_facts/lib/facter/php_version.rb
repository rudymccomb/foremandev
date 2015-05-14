Facter.add("php_version") do
  setcode do
    Facter::Util::Resolution.exec("/usr/bin/php --version | grep PHP | sed -n '1{p;q}' ")
  end
end
