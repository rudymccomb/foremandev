class users::azarichnyi {

#class { 'sudo':}

  sudo::conf { 'azarichnyi':
        priority => 10,
        content  => "azarichnyi ALL=(ALL)  ALL",
        ensure   => 'present',
        }



  case $::osfamily {
   'redhat': {
    #redhat specific

    user { 'azarichnyi':
     ensure           => 'present',
     comment          => 'ecomm dev azarichnyi',
     #gid              => '555',
     groups           => [ 'users','wheel' ],
     home             => '/home/azarichnyi',
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

      user { 'azarichnyi':
        ensure   => 'present',
        home => '/home/azarichnyi',
        groups   => [ 'sudo','adm' ],
        comment   => 'director azarichnyi',
        managehome      => true,
        password_max_age => '99999',
        password_min_age => '0',
        shell            => '/bin/bash',
        }

    }

  }
}
