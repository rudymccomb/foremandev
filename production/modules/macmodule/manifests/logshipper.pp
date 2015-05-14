class macmodule::logshipper {

 service { "com.apple.syslogd":
                enable    => true,
                ensure    => 'running',
                #require   => File["/Library/LaunchDaemons/com.puppetlabs.puppet.plist"],
        }

 file { "/etc/syslog.conf":
                notify => Service["com.apple.syslogd"],
                source => "puppet:///modules/macmodule/syslog.conf",
                owner => 'root',
                group => 'wheel',
                mode => '0644',
                ensure => file,
                }

}
