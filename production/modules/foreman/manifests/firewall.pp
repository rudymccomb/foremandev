#manages the firewall
class foreman::firewall {


  Firewall { require => Package['iptables-persistent'], }


  firewall { '100 allow ssh:22':
    ensure => present,
    state  => ['NEW'],
    dport  => '22',
    proto  => 'tcp',
    action => accept,
  }

  firewall { '101 allow Puppet:8140':
    ensure => present,
    port   => '8140',
    proto  => 'tcp',
    action => accept,
  }

  firewall { '102 allow Puppet Kick:8139':
    ensure => present,
    port   => '8139',
    proto  => 'tcp',
    action => accept,
  }

  firewall { '103 allow MCollective:61613':
    ensure => present,
    port   => '8139',
    proto  => 'tcp',
    action => accept,
  }

  firewall { '200 allow http and https access':
    ensure => present,
    dport  => [80, 443],
    proto  => 'tcp',
    action => accept,
  }


}
