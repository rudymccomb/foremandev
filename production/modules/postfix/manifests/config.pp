# configures postfix
class postfix::config {
  File {
    owner => 'root',
    group => 'root',
    mode => 0644,
  }


    file { '/etc/postfix/master.cf':
      ensure  => present,
      source  => 'puppet:///modules/postfix/master.cf',
      notify  => Class['postfix::service'],
      require => Class['postfix::install'],

    }

    file { '/etc/postfix/main.cf':
      ensure  => present,
      content => template('postfix/main.cf.erb'),
      notify  => Class['postfix::service'],
      require => Class['postfix::install'],

    }
}
