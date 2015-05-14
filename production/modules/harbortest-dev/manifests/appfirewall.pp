#for calhfwprd06.foo.com
class foo-dev::appfirewall {



exec { "blank_iptables_start":
path        => "/usr/bin:/usr/sbin:/bin",
unless      => "/sbin/service iptables status",
command     => '/sbin/iptables -L',
}
Firewall { require => Exec['blank_iptables_start'], }

firewall { '100 allow mysql:3306':
    port   => '3306',
    ensure => present,
    proto  => 'tcp',
    source => '10.100.23.32',
    destination => '192.168.77.91',
    action => accept,
  }

 firewall { '100 allow ssh:22':
        state => ['NEW'],
	      ensure => present,
        dport => '22',
        proto => 'tcp',
        #jump  => 'ACCEPT',
	      action => accept,
    }

firewall { '200 allow http and https access':
        ensure => present,
        dport => [80, 443],
	      proto => tcp,
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
        ensure => absent,
        dport => '22',
        proto => 'tcp',
	      #outiface => "eth0",
        #jump  => 'ACCEPT',
        source => '10.230.12.0/24',
        action => accept,
    }

firewall { '100 allow rsyslog:514':
    port   => '514',
    ensure => present,
    proto  => 'udp',
    #source => '10.100.23.32',
    destination => '10.100.24.204',
    action => accept,
  }

}
