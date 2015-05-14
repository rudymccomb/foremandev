Facter.add("git_version") do
  setcode do
    Facter::Util::Resolution.exec("/usr/bin/git --version | awk '{print $2, $3}'")
  end
end
