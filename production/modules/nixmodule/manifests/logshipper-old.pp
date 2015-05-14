class nixmodule::logshipper {

 #$rsyslog_package = $operatingsystem ? {
  #          default => "rsyslog"
  #      }

  package { 'rsyslog5':
    ensure => absent,
  }


  package { 'rsyslog':
            ensure   => installed,
            #require  => Package[rsyslog]
    }

  service { 'rsyslog':
                ensure    => running,
                enable    => true,
                require   => Package['rsyslog']
                #require   => File["/Library/LaunchDaemons/com.puppetlabs.puppet.plist"],
        }

  file { '/etc/rsyslog.d/logstash.conf':
    ensure  => file,
    notify  => Service['rsyslog'],
    source  => 'puppet:///modules/nixmodule/logstash.conf',
    owner   => 'root',
    group   => 'wheel',
    mode    => '0644',
    require => Package['rsyslog']
  }

  service { syslog:
    ensure => stopped,
    enable => false,
    before => Service["rsyslog"],
  }

  service { syslog-ng:
    ensure => stopped,
    enable => false,
    before => Service["rsyslog"],
  }

  service { sysklogd:
    ensure => stopped,
    enable => false,
    before => Service["rsyslog"],
  }

}
