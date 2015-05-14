class osx-stepserver::sshd-config{

  service { "ssh":
                 enable    => true,
                 ensure    => 'running',
                 #require   => File["/Library/LaunchDaemons/com.puppetlabs.puppet.plist"],
         }

  file { "/etc/sshd_config":
                 notify => Service["ssh"],
                 source => "puppet:///modules/osx-stepserver/sshd_config",
                 owner => 'root',
                 group => 'wheel',
                 mode => '0644',
                 ensure => file,
                 }



}
