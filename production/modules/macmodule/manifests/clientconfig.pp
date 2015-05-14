class macmodule::clientconfig{

  	#displays system info, ip, computername  at login by clicking time in upper-right corner
        exec {'display sysinfo at login screen':
          command => "/usr/bin/defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName",
          }
        
        #displays msg at login window
        exec {'display msg at login screen':
          command => "/usr/bin/defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText 'Property of foo Tools'",
          }

       	# Puts /etc/puppet/environments/production/modules/macmodule/puppet.conf on the client.
        # On the client, it's going into /etc/puppet/puppet.conf
        file { "/etc/puppet/puppet.conf":
                content => template("macmodule/puppet.conf.erb"),
                owner => root,
                group => wheel,
                mode => 644,
                ensure => present,
                }

}
