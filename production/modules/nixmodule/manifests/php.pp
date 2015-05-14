class nixmodule::php {
	package {'php':
		ensure => present,
#		before => File['/etc/php.ini'],
#		ensure => '5.2',
	}
 
#	file {'/etc/php.ini':
#		ensure => file,
#	}
}
