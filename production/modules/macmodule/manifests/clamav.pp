class macmodule::clamav {
#this install firefox 26
 # $package_name = 'Firefox%2028.0.dmg'

  package { clamxav:
    #ensure   => present,
    provider => appdmg,
    source   => "puppet:///modules/macmodule/ClamXav_2.6.2.dmg",
  }
}
