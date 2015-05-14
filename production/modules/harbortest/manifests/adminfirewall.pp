#for calhfwprd06.foo.com
class foo::adminfirewall {



  exec { 'blank_iptables_start':
    path        => '/usr/bin:/usr/sbin:/bin',
    unless      => '/sbin/service iptables status',
    command     => '/sbin/iptables -L',
  }
  Firewall { require => Exec['blank_iptables_start'], }


  firewall { '100 allow ssh:22':
    ensure => present,
    state  => ['NEW'],
    dport  => '22',
    proto  => 'tcp',
    #jump  => 'ACCEPT',
    action => accept,
  }

  firewall { '101 allow mysql:3306':
    ensure => present,
    port   => '3306',
    proto  => 'tcp',
    source => '192.168.77.31',
    #destination => '192.168.77.31',
    action => accept,
  }

  firewall { '102 allow mysql:3306':
    ensure => present,
    port   => '3306',
    proto  => 'tcp',
    source => '192.168.77.41',
    #destination => '192.168.77.41',
    action => accept,
  }

  firewall { '103 allow mysql:3306':
    port   => '3306',
    ensure => present,
    proto  => 'tcp',
    source => '192.168.77.51',
    #destination => '192.168.77.51',
    action => accept,
  }

  firewall { '104 allow mysql:3306':
    port   => '3306',
    ensure => present,
    proto  => 'tcp',
    source => '192.168.77.71',
    #destination => '192.168.77.71',
    action => accept,
  }

  firewall { '105 allow mysql:3306':
    port   => '3306',
    ensure => present,
    proto  => 'tcp',
    source => '192.168.77.81',
    #destination => '192.168.77.81',
    action => accept,
  }

  firewall { '106 allow mysql:3306':
    port   => '3306',
    ensure => present,
    proto  => 'tcp',
    source => '192.168.77.91',
    #destination => '192.168.77.91',
    action => accept,
  }


  firewall { '108 allow mysql:3306':
    port   => '3306',
    ensure => present,
    proto  => 'tcp',
    source => '192.168.77.182',
    #destination => '192.168.77.182',
    action => accept,
  }

  firewall { '109 allow mysql:3306':
    port   => '3306',
    ensure => present,
    proto  => 'tcp',
    source => '192.168.77.20',
    #destination => '192.168.77.20',
    action => accept,
  }

  firewall { '110 allow mysql:3306':
    port   => '3306',
    ensure => present,
    proto  => 'tcp',
    source => '192.168.77.21',
    #destination => '192.168.77.21',
    action => accept,
  }

  firewall { '111 allow mysql:3306':
    port   => '3306',
    ensure => present,
    proto  => 'tcp',
    source => '192.168.73.10',
    #destination => '192.168.77.21',
    action => accept,
  }

  firewall { '112 allow mysql:3306':
    port   => '3306',
    ensure => present,
    proto  => 'tcp',
    source => '192.168.73.30',
    #destination => '192.168.77.21',
    action => accept,
  }

  firewall { '113 allow mysql:3306':
      port   => '3306',
      ensure => present,
      proto  => 'tcp',
      source => '192.168.73.40',
      #destination => '192.168.77.21',
      action => accept,
  }

  firewall { '200 allow http and https access':
        ensure => present,
        dport => [80, 443],
	      proto => tcp,
        #jump  => 'ACCEPT',
        action => accept,
  }

 #firewall { '100 allow ssh:22 from 117 subnet':
  #      state => ['NEW', 'ESTABLISHED'],
  #      ensure => present,
  #      dport => '22',
  #      proto => 'tcp',
  #      #outiface => "eth0",
  #      #jump  => 'ACCEPT',
	 #     source => '10.100.117.0/24',
    #    action => accept,
    #}

 #firewall { '100 allow ssh:22 from vpn subnet':
  #      state => ['NEW', 'ESTABLISHED'],
  #      ensure => absent,
  #      dport => '22',
  #      proto => 'tcp',
	 #     #outiface => "eth0",
        #jump  => 'ACCEPT',
  #      source => '10.230.12.0/24',
  #      action => accept,
  #  }


}
