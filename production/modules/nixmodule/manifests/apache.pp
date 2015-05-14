class nixmodule::apache {
    
    #install httpd aka apache
    package { "httpd": 
        ensure => present,
    }

    #ensures service is running
    service {"httpd":
	ensure => running,
	enable => true,
	require	=> Package[httpd],
	#subscribe => File["puppet:///modules/httpd.conf"]
	}
#include php
#include apache::mod::php

    #ensures this directory
#    file { "/etc/httpd/":
#	source => "puppet://server/vol/mnt/madmin/httpd",
#	recurse => true,
#	}



}
