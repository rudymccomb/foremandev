  #class nixmodule::logshipper manages shipping of linux logs via rsyslog and
  # and rsyslog module
class nixmodule::logshipper {

  include epel

  #file { '/etc/rsyslog.d/logstash.conf':
  #  ensure  => file,
  #  notify  => Service['rsyslog'],
  #  source  => 'puppet:///modules/nixmodule/logstash.conf',
  #  owner   => 'root',
  #  group   => 'wheel',
  #  mode    => '0644',
  #  require => Class['rsyslog::client']
  #}

  #file { '/etc/rsyslog.d/infoseclog.conf':
  #  ensure  => file,
  #  notify  => Service['rsyslog'],
  #  source  => 'puppet:///modules/nixmodule/infoseclog.conf',
  #  owner   => 'root',
  #  group   => 'wheel',
  #  mode    => '0644',
  #  require => Class['rsyslog::client']
  #}

  #rsyslog module used below
  service { 'syslog':
    ensure => stopped,
    enable => false,
    before => Class['rsyslog::client']
  }

  service { 'syslog-ng':
    ensure => stopped,
    enable => false,
    before => Class['rsyslog::client']
  }

  service { 'sysklogd':
    ensure => stopped,
    enable => false,
    before => Class['rsyslog::client']
  }

  class{ 'rsyslog::client':
    log_remote     => true,
    log_local      => true,
    log_auth_local => true,
    require        => Class['epel'],
    remote_servers => [
      {
        host      => '10.100.24.204',
        port      => '5514',
        pattern   => '*.*',
        protocol  => 'tcp',
      },
      {
        host      => '10.100.21.75',
        port      => '514',
        pattern   => '*.*',
        protocol  => 'udp',
      },
    ]
  }
}
