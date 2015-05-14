class foo::dbfirewall {


exec { "blank_iptables_start":
path        => "/usr/bin:/usr/sbin:/bin",
unless      => "/sbin/service iptables status",
command     => '/sbin/iptables -L',
}
Firewall { require => Exec['blank_iptables_start'], }

firewall { '101 allow mysql:3306':
    port   => '3306',
    ensure => present,
    proto  => 'tcp',
    source => '192.168.77.31',
    #destination => '10.100.23.32',
    action => accept,
  }

firewall { '102 allow mysql:3306':
    port   => '3306',
    ensure => present,
    proto  => 'tcp',
    source => '192.168.77.41',
    #destination => '10.100.23.32',
    action => accept,
  }

firewall { '103 allow mysql:3306':
    port   => '3306',
    ensure => present,
    proto  => 'tcp',
    source => '192.168.77.51',
    #destination => '10.100.23.32',
    action => accept,
  }

firewall { '104 allow mysql:3306':
    port   => '3306',
    ensure => present,
    proto  => 'tcp',
    source => '192.168.77.71',
    #destination => '10.100.23.32',
    action => accept,
  }

firewall { '105 allow mysql:3306':
    port   => '3306',
    ensure => present,
    proto  => 'tcp',
    source => '192.168.77.81',
    #destination => '10.100.23.32',
    action => accept,
  }

firewall { '106 allow mysql:3306':
    port   => '3306',
    ensure => present,
    proto  => 'tcp',
    source => '192.168.77.91',
    #destination => '10.100.23.32',
    action => accept,
  }

firewall { '107 allow mysql:3306':
    port   => '3306',
    ensure => present,
    proto  => 'tcp',
    source => '192.168.73.15',
    #destination => '10.100.23.32',
    action => accept,
  }

firewall { '108 allow mysql:3306':
    port   => '3306',
    ensure => present,
    proto  => 'tcp',
    source => '192.168.73.17',
    #destination => '10.100.23.32',
    action => accept,
  }

firewall { '109 allow mysql:3306':
    port   => '3306',
    ensure => present,
    proto  => 'tcp',
    source => '192.168.77.182',
    #destination => '10.100.23.32',
    action => accept,
  }

firewall { '110 allow mysql:3306':
    port   => '3306',
    ensure => present,
    proto  => 'tcp',
    source => '10.100.22.64',
    #destination => '10.100.23.32',
    action => accept,
  }

firewall { '111 allow rsyslog:3306':
    port   => '3306',
    ensure => absent,
    proto  => 'tcp',
    source => '10.100.22.64',
    #destination => '10.100.23.32',
    action => accept,
  }

 firewall { '100 allow ssh:22':
        state => ['NEW'],
	#ensure => present,
        dport => '22',
        proto => 'tcp',
        #jump  => 'ACCEPT',
	action => accept,
    }

 #firewall { '100 allow ssh:22 from 117 subnet':
 #       state => ['NEW', 'ESTABLISHED'],
 #       ensure => present,
 #       dport => '22',
 #       proto => 'tcp',
        #outiface => "eth0",
        #jump  => 'ACCEPT',
#	source => '10.100.117.0/24',
#        action => accept,
#    }

 #firewall { '100 allow ssh:22 from vpn subnet':
 #       state => ['NEW', 'ESTABLISHED'],
 #       ensure => present,
 #       dport => '22',
 #       proto => 'tcp',
	#outiface => "eth0",
        #jump  => 'ACCEPT',
  #      source => '10.230.12.0/24',
  #      action => accept,
  #  }


}
