# Installs Yum repo for Mysql: http://dev.mysql.com/downloads/repo/
class repo_mysql {
  case $::operatingsystem {
    centos, redhat, amazon: {
      $baseurl = "http://repo.mysql.com/yum/mysql-5.6-community/el/${::os_maj_version}"
    }
    fedora: {
      $baseurl = 'http://repo.mysql.com/yum/mysql-community/fc/$releasever'
    }
    default: {
      fail('ERROR: Your operating system is not supported for the MySQL repository')
    }
  }

  Yumrepo {
    enabled  => 1,
    gpgcheck => 1,
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-mysql',
  }

  file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-mysql':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/repo_mysql/RPM-GPG-KEY-mysql',
  }
  ->
  yumrepo {
    'mysql-community':
      baseurl  => "${baseurl}/\$basearch/",
      descr    => 'MySQL Community Server';
    'mysql-community-src':
      baseurl  => "${baseurl}/SRPMS/",
      descr    => 'MySQL Community Server - Source';
  }
}
