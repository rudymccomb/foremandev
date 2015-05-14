class macmodule::firefox {
#this install firefox 31
  $package_name = 'Firefox%2031.0.dmg'

  package { $package_name:
    ensure   => present,
    provider => appdmg,
    source   => "http://download.cdn.mozilla.net/pub/mozilla.org/firefox/releases/31.0/mac/en-US/${package_name}",
  }
}
