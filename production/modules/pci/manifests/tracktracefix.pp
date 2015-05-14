class pci::tracktracefix {

# Puts /etc/puppet/environments/production/modules/pci/files/pcisvnfix.conf.erb on the client.
        # On the client, it's going into /etc/httpd/conf.d/pcisnvfix
        file { "/etc/httpd/conf.d/tracktracefix.conf":
		notify => Service["httpd"],                
		content => template("pci/pcitrackfix.conf.erb"),
                #owner => root,
                #group => wheel,
                ensure => present,
                }

	service { "httpd":
		enable => true,
		ensure => 'running',
	}


}
