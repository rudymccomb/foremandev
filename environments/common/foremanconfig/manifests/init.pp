class foremanconfig {

	# the mcollectived agent
        # Typically you'd install this everywhere
	class { 'mco_profile::server':
		middleware_hosts => [ 'localhost' ],
	}
	# Allow user to run mcollective
        file { '/etc/mcollective/clients/frm2_client.pem':
        	source => '/root/.mcollective.d/credentials/certs/frm2_client.pem',
	}

        mcollective::common::setting { 'plugin.activemq.heartbeat_interval':
		value => '30',
	}
        
        # the mco command line tool
        # Typically just on a management host
        class { 'mco_profile::client':
                middleware_hosts => [ 'localhost' ],
        }

	# the central server all mcollective servers (agents) talk to
        # typically you puppet master
        include mco_profile::middleware::activemq
}
