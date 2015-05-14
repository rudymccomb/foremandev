class rvm::system(
  $version=undef,
  $proxy_url=undef) {

  $actual_version = $version ? {
    undef     => 'latest',
    'present' => 'latest',
    default   => $version,
  }

  # curl needs to be installed
  case $::kernel {
    Linux: {
      ensure_packages(['curl'])
      Package['curl'] -> Exec['system-rvm']
    }
    default: {}
  }

  exec { 'system-rvm':
    path        => '/usr/bin:/usr/sbin:/bin',
    command     => "/usr/bin/curl -sSL https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer | \
                    bash -s -- --version ${actual_version}",
    creates     => '/usr/local/rvm/bin/rvm',
    environment => $proxy_url ? { undef => undef, default => [ "http_proxy=${proxy_url}" , "https_proxy=${proxy_url}" ]},
  }

  # the fact won't work until rvm is installed before puppet starts
  if "${::rvm_version}" != "" {
    notice("RVM version ${::rvm_version}")

    if ($version != undef) and ($version != present) and ($version != $::rvm_version) {
      # Update the rvm installation to the version specified
      notify { 'rvm-get_version':
        message => "RVM updating to version ${version}",
      }
      exec { 'system-rvm-get':
        path        => '/usr/local/rvm/bin:/usr/bin:/usr/sbin:/bin',
        command     => "rvm get ${version}",
        before      => Exec['system-rvm'], # so it doesn't run after being installed the first time
        environment => $proxy_url ? { undef => undef, default => [ "http_proxy=${proxy_url}" , "https_proxy=${proxy_url}" ]},
        require     => Notify['rvm-get_version'],
      }
    }
  }
}
