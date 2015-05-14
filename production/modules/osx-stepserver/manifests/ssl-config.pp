#class osx-stepserver manages the stibo mac server
class osx-stepserver::ssl-config{

  service { 'httpd':
    ensure    => stopped,
    enable    => false,
    #require   => File["/Library/LaunchDaemons/com.puppetlabs.puppet.plist"],
  }

  file { '/etc/apache2/extra/httpd-ssl.conf':
    ensure => file,
    notify => Service['httpd'],
    source => 'puppet:///modules/osx-stepserver/httpd-ssl.conf',
    owner  => 'root',
    group  => 'wheel',
    mode   => '0644',
  }

}
