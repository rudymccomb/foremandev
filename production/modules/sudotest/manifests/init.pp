#Class to run create and run cron jobs

class sudotest {

    class { 'sudo':}
    #purges default sudoers file 
    #class { 'sudo':
    #  purge               => false,
    #  config_file_replace => false,
    #}



account { 'kelseyhightower':
        ensure   => 'absent',
        username => 'kelseyhightower',
        home_dir => '/home/kelseyhightower',
        password => '$1$gsOuMK7m$ggNJx3h9MWccLWfUWswwD.',
        #create_group => 'sudo',
        groups   => [ 'users','wheel' ],
        comment   => 'devops kelsey hightower',
        }

    sudo::conf { 'kelseyhightower':
    priority => 10,
    content  => 'kelseyhightower ALL=(ALL) NOPASSWD: ALL',
    #purge => true,
    ensure => 'absent',
   }


account { 'cadmin':
        ensure   => 'present',
        username => 'cadmin',
        home_dir => '/home/cadmin',
        password => '$6$dZIRNx31dwRQjXLz$7Ab29bveOlzwW5RIcR4ck6pgMw7VLww8edcCMaBNeIHlTltVbVEp5n2ZxdKNdWB0re23m8KAKaRmHlXRVC5iJ.',
        #create_group => 'sudo',
        groups   => [ 'users','wheel' ],
        comment   => 'devops cadmin',
        }

 sudo::conf { 'cadmin':
      priority => 10,
      content  => "cadmin ALL=(ALL)  ALL",
      ensure   => 'present',
    }
    #sudo::conf { 'web':
    #  source => 'puppet:///files/etc/sudoers.d/web',
    #}
    sudo::conf { 'admins':
      priority => 10,
      content  => "%admins ALL=(ALL) NOPASSWD: ALL",
    }
	
    #sudo::conf { 'joe':
    #  priority => 60,
    #  source   => 'puppet:///files/etc/sudoers.d/users/joe',
    #}

}

