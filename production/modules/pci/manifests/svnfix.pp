class pci::svnfix {	

# Puts /etc/puppet/environments/production/modules/pci/files/pcisvnfix.conf.erb on the client.
        # On the client, it's going into /etc/httpd/conf.d/pcisnvfix
        file { "/etc/httpd/conf.d/pcisnvfix.conf":
                #notify =>Service["httpd"], 
		content => template("pci/pcisvnfix.conf.erb"),
                owner => root,
                group => wheel,
                mode => 644,
                ensure => present,
                }

  	#service { "httpd":
         #       enable => true,
         #       ensure => 'running',
        #}



}
