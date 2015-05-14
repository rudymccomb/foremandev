class user-accounts::rmccomb {

sudo::conf { 'rmccomb':
        priority => 10,
        content  => "rmccomb ALL=(ALL)  ALL",
        ensure   => 'present',
        } 

sudo::conf { 't_rmccomb':
        priority => 10,
        content  => "t_rmccomb ALL=(ALL)  ALL",
        ensure   => 'present',
        } 


case $::osfamily {
   'redhat': {
    #redhat specific
    	account { 'rmccomb':
    	ensure   => 'present',
    	username => 'rmccomb',
    	home_dir => '/home/rmccomb',
        managehome => true,
        path => "/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin",
	password => '$1$gsOuMK7m$ggNJx3h9MWccLWfUWswwD.',
    	groups   => [ 'users','wheel' ],
    	comment   => 'devops rmccomb',
	}
      user { 't_rmccomb':
  	ensure           => 'present',
  	comment          => 'devops rmccomb',
  	#gid              => '507',
  	groups           => ['wheel', 'users'],
  	home             => '/home/t_rmccomb',
  	password         => '$1$gsOuMK7m$ggNJx3h9MWccLWfUWswwD.',
  	#password_max_age => '90',
  	#password_min_age => '7',
  	shell            => '/bin/bash',
  	#uid              => '507',
      }
     }

   'debian':{
   #ubuntu/debian
   account { 'rmccomb':
        ensure   => 'present',
        username => 'rmccomb',
        home_dir => '/home/rmccomb',
        managehome => true,
        path => "/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin",
        password => '$1$gsOuMK7m$ggNJx3h9MWccLWfUWswwD.',
        groups   => [ 'sudo','adm' ],
        comment   => 'devops rmccomb',
        }
   
   }

   }

}
