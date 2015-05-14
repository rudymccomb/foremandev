class users::btriol {

#class { 'sudo':}

  sudo::conf { 'btriol':
        priority => 10,
        content  => "btriol ALL=(ALL)  ALL",
        ensure   => 'present',
        }



  case $::osfamily {
   'redhat': {
    #redhat specific

    user { 'btriol':
     ensure           => 'present',
     comment          => 'sysadmin btriol',
     #gid              => '555',
     groups           => [ 'users','wheel' ],
     home             => '/home/btriol',
     managehome       => true,
     #password         => '$1$4qGCBzdd$yQzQRkQ9HwUq1cyiod/hc0',
     password_max_age => '99999',
     password_min_age => '0',
     shell            => '/bin/bash',
     system           => false,
	   #create_group => 'sudo',
     #uid              => '555',
	  }



   }

   'debian': {
     #redhat specific

      user { 'btriol':
        ensure   => 'present',
        home => '/home/btriol',
        groups   => [ 'sudo','adm' ],
        comment   => 'sysadmin btriol',
        managehome      => true,
        password_max_age => '99999',
        password_min_age => '0',
        shell            => '/bin/bash',
        }

    }

  }
}
