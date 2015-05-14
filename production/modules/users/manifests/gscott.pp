class users::gscott {

#class { 'sudo':}

  sudo::conf { 'gscott':
        priority => 10,
        content  => "gscott ALL=(ALL)  ALL",
        ensure   => 'present',
        }



  case $::osfamily {
   'redhat': {
    #redhat specific

    user { 'gscott':
     ensure           => 'present',
     comment          => 'director gscott',
     #gid              => '555',
     groups           => [ 'users','wheel' ],
     home             => '/home/gscott',
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

      user { 'gscott':
        ensure   => 'present',
        home => '/home/gscott',
        groups   => [ 'sudo','adm' ],
        comment   => 'director gscott',
        managehome      => true,
        password_max_age => '99999',
        password_min_age => '0',
        shell            => '/bin/bash',
        }

    }

  }
}
