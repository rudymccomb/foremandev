class macmodule::ecommfirefox {
#this install legacy firefox 17.0.1
  $package_name = 'Firefox%2017.0.1.dmg'

  package { $package_name:
    ensure   => present,
    provider => appdmg,
    source   => "http://download.cdn.mozilla.net/pub/mozilla.org/firefox/releases/17.0.1/mac/en-US/${package_name}",
  }
}
