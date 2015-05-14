# == Class: foo::rmsendmail
# removes sendmail application
class foo::rmsendmail {
  # resources
  package { 'sendmail':
    ensure  => purged,
    require => Service['sendmail'],
  }

  service { 'sendmail':
    ensure => stopped,
    enable => false,
    # pattern => 'sendmail',
  }
}
