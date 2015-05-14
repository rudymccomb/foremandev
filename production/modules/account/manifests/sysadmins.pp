class account::sysadmins {
  case $::osfamily {
   'redhat': {
    #redhat specific
    	account { 'btriol':
    	ensure   => 'present',
    	username => 'btriol',
    	home_dir => '/home/btriol',
        password => '$1$4qGCBzdd$yQzQRkQ9HwUq1cyiod/hc0',    	
	#create_group => 'sudo',
    	groups   => [ 'users','wheel' ],
    	comment   => 'sysadmin btriol',
	}

	account { 'rmccomb':
        ensure   => 'present',
        username => 'rmccomb',
        home_dir => '/home/rmccomb',
        password => '$1$gsOuMK7m$ggNJx3h9MWccLWfUWswwD.',
        #create_group => 'sudo',
        groups   => [ 'users','wheel' ],
        comment   => 'devops rmccomb',
        }
	
	#remove following accounts
	account { 'nstoianov':
        ensure   => 'absent',
        username => 'nstoianov',
	home_dir => '/home/nstoianov',
	}

	#remove following accounts
        account { 'madmin':
        ensure   => 'absent',
        username => 'madmin',
        home_dir => '/home/madmin',
        }

	#remove following accounts
        account { 'owillane':
        ensure   => 'absent',
        username => 'owillane',
        home_dir => '/home/owillane',
        }

   }

   'debian': {
    	account { 'btriol':
        ensure   => 'present',
        username => 'btriol',
        home_dir => '/home/btriol',
        groups   => [ 'sudo','adm' ],
        comment   => 'sysadmin btriol',
        }

	account { 'rmccomb':
        ensure   => 'present',
        username => 'rmccomb',
        home_dir => '/home/rmccomb',
        password => '$1$gsOuMK7m$ggNJx3h9MWccLWfUWswwD.',
        groups   => [ 'sudo','adm' ],
        comment   => 'devops rmccomb',
        }

        account { 'gscott':
        ensure   => 'present',
        username => 'gscott',
        home_dir => '/home/gscott',
        groups   => [ 'sudo','adm' ],
        comment   => 'sysadmin gscott',
        }

    }



  }

}
