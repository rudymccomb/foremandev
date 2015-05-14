class macmodule::adbind {
#this install firefox 26
 # $package_name = 'Firefox%2027.0.dmg'
#

class { 'x_types': 
       safe => 'false', 

if "$::fqdn" == "$::certname" {
  x_node { 'foo.com':
    active        => 'true',
    ensure        => 'present',
    provider      => 'activedirectory',
    active        => 'true',
    computerid    => 'cabmpd017474.foo.com',
    username      => 'hd_rmccomb',
    password      => 'S@1athe513b!',
    ou            => 'OU=AppleSystems,OU=Workstations,DC=foo,DC=com',
    domain        => 'foo.com',
    mobile        => 'enable',
    mobileconfirm => 'enable',
    localhome     => 'enable',
    useuncpath    => 'disable',
    protocol      => 'smb',
    shell         => '/bin/bash',
    uid           => 'primaryGroupID',
    alldomains    => 'enable',
    #groups        => 'SOME_DOMAIN\some_group,SOME_DOMAIN\another_group',
    passinterval  => '0',
  }
} else {
  $msg = "Our FQDN ($::fqdn) does not match our certname ($::certname). Aborting Puppet run..."
  notice($msg)
  notify { $msg: }
}

}
}
