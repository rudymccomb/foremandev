class users::devops {

#class { 'sudo':}

      sudo::conf { 'rmccomb':
        priority => 10,
        content  => "rmccomb ALL=(ALL)  ALL",
        ensure   => 'present',
        }

      sudo::conf { 'hhuggins':
       priority => 10,
       content  => "hhuggins ALL=(ALL)  ALL",
       ensure   => 'present',
       }


  case $::osfamily {
   'redhat': {
    #redhat specific


	    user { 'rmccomb':
  	    ensure           => 'present',
  	    comment          => 'devops rmccomb',
  	    #gid             => '513',
  	    groups           => ['wheel', 'users'],
  	    home             => '/home/rmccomb',
	      managehome	      => true,
  	    password         => '$1$gsOuMK7m$ggNJx3h9MWccLWfUWswwD.',
  	    password_max_age => '99999',
  	    password_min_age => '0',
  	    shell            => '/bin/bash',
  	    #uid             => '513',
	    }

      user { 'hhuggins':
  	    ensure           => 'present',
  	    comment          => 'devops hhuggins',
  	    #gid             => '522',
  	    groups           => ['wheel', 'users'],
  	    home             => '/home/hhuggins',
	      managehome	     => true,
  	    password         => '$1$HjkCOYAu$pg5V1d8adUzJtk9ecfeBX1',
  	    password_max_age => '99999',
  	    password_min_age => '0',
  	    shell            => '/bin/bash',
  	    #uid              => '522',
      }

	#use below pattern to remove following users
	#user { 'nstoianov':
  #      ensure   => 'absent',
  #      username => 'nstoianov',
	#      home => '/home/nstoianov',
	#}


   }

   'debian': {

      user { 'rmccomb':
        ensure           => 'present',
        comment          => 'devops rmccomb',
        groups           => ['sudo', 'adm'],
        home             => '/home/rmccomb',
        managehome	      => true,
        password         => '$1$gsOuMK7m$ggNJx3h9MWccLWfUWswwD.',
        password_max_age => '99999',
        password_min_age => '0',
        shell            => '/bin/bash',
        }

      user { 'hhuggins':
        ensure           => 'present',
        comment          => 'devops hhuggins',
        groups           => ['sudo', 'adm'],
        home             => '/home/hhuggins',
        managehome	      => true,
        password         => '$1$HjkCOYAu$pg5V1d8adUzJtk9ecfeBX1',
        password_max_age => '99999',
        password_min_age => '0',
        shell            => '/bin/bash',
        }

    }

  }
}
