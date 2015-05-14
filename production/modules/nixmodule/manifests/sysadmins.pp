class nixmodule::sysadmins {

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






#file { "/home/hhuggins":
#    ensure            =>  directory,
#    owner             =>  hhuggins,
#    group             =>  hhuggins,
#    mode              =>  0750,
    #require           =>  [ User[$title], Group[$title] ],
#  }







	#use below pattern to remove following users
	#user { 'nstoianov':
  #      ensure   => 'absent',
  #      username => 'nstoianov',
	#      home => '/home/nstoianov',
	#}


   }

   'debian': {

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
