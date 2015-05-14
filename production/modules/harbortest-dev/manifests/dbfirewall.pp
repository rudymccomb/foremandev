class foo-dev::dbfirewall {

firewall { '100 allow mysql:3306':
    port   => '3306',
    ensure => present,
    proto  => 'tcp',
    source => '192.168.77.91',
    destination => '10.100.23.32',
    action => accept,
  }

 firewall { '100 allow ssh:22 from calhfwprd06':
	ensure => present,
        dport => '22',
        proto => 'tcp',
	source => '192.168.77.91',
	destination => '10.100.23.32',
        #jump  => 'ACCEPT',
	action => accept,
    }

 firewall { '100 allow ssh:22 from 117 subnet':
        state => ['NEW', 'ESTABLISHED'],
        ensure => present,
        dport => '22',
        proto => 'tcp',
        #outiface => "eth0",
        #jump  => 'ACCEPT',
	source => '10.100.117.0/24',
        action => accept,
    }

 firewall { '100 allow ssh:22 from vpn subnet':
        state => ['NEW', 'ESTABLISHED'],
        ensure => present,
        dport => '22',
        proto => 'tcp',
	#outiface => "eth0",
        #jump  => 'ACCEPT',
        source => '10.230.12.0/24',
        action => accept,
    }


}
