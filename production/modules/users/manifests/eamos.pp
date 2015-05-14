class users::eamos {

#class { 'sudo':}

  sudo::conf { 'eamos':
        priority => 11,
        content  => "eamos ALL=(ALL)  ALL",
        ensure   => 'present',
        }



  case $::osfamily {
   'redhat': {
    #redhat specific

    user { 'eamos':
     ensure           => 'present',
     comment          => 'infosec eamos',
     #gid              => '555',
     groups           => [ 'users','wheel' ],
     home             => '/home/eamos',
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

      user { 'eamos':
        ensure   => 'present',
        home => '/home/eamos',
        groups   => [ 'sudo','adm' ],
        comment   => 'director eamos',
        managehome      => true,
        password_max_age => '99999',
        password_min_age => '0',
        shell            => '/bin/bash',
        }

    }

  }
}
