# removes sendmail and installs and configures postfix for foo admin
class foo::postfix {

package { 'sendmail':
  ensure  => purged,
  require => Service['sendmail'],
}

service { 'sendmail':
  ensure => stopped,
  enable => false,
  before => Service['postfix'],
}

package { [ 'postfix', 'mailx' ]:
    ensure  => latest,
    require => Package['sendmail'],
}

File {
  owner => 'root',
  group => 'root',
  mode => 0644,
}


  file { '/etc/postfix/master.cf':
    ensure  => present,
    source  => 'puppet:///modules/foo/master.cf',
    notify  => Service['postfix'],
    require => Package['postfix'],

  }

  file { '/etc/postfix/main.cf':
    ensure  => present,
    content => template('foo/main.cf.erb'),
    notify  => Service['postfix'],
    require => Package['postfix'],

  }

  service { 'postfix':
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
    require    => Package['postfix'],
  }

}
