class users::ekulish {

#class { 'sudo':}

  sudo::conf { 'ekulish':
        priority => 10,
        content  => "ekulish ALL=(ALL)  ALL",
        ensure   => 'present',
        }



  case $::osfamily {
   'redhat': {
    #redhat specific

    user { 'ekulish':
     ensure           => 'present',
     comment          => 'ecomm dev ekulish',
     #gid              => '555',
     groups           => [ 'users','wheel' ],
     home             => '/home/ekulish',
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

      user { 'ekulish':
        ensure   => 'present',
        home => '/home/ekulish',
        groups   => [ 'sudo','adm' ],
        comment   => 'director ekulish',
        managehome      => true,
        password_max_age => '99999',
        password_min_age => '0',
        shell            => '/bin/bash',
        }

    }

  }
}
