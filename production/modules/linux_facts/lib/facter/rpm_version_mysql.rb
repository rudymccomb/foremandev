Facter.add("rpm_version_mysql") do
  setcode do
    Facter::Util::Resolution.exec("/bin/rpm -q mysql")
  end
end
