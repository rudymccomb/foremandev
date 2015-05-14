class hardened::nexpose {


exec { "blank_iptables_start":
path        => "/usr/bin:/usr/sbin:/bin",
unless      => "/sbin/service iptables status",
command     => '/sbin/iptables -L',
}
Firewall { require => Exec['blank_iptables_start'], }


firewall { '101 allow nexspose scanner':
    #port   => '3306',
    ensure => present,
    proto  => 'tcp',
    source => '10.100.21.126',
    #destination => '10.100.23.32',
    action => accept,
  }


}
