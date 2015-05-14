Facter.add("rpm_version_php") do
  setcode do
    Facter::Util::Resolution.exec("/bin/rpm -q php53")
  end
end
