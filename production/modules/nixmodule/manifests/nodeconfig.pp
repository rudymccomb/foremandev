class nixmodule::nodeconfig{

case $::osfamily {
   'redhat': {
       	# Puts /etc/puppet/environments/production/modules/nixmodule/puppet.conf on the client.
        # On the client, it's going into /etc/puppet/puppet.conf
        file { "/etc/puppet/puppet.conf":
                content => template("nixmodule/puppet.conf.erb"),
                owner => root,
                group => wheel,
                mode => 644,
                ensure => present,
                }
	}
   'debian': {

 	# Puts /etc/puppet/environments/production/modules/nixmodule/puppet.conf on the client.
        # On the client, it's going into /etc/puppet/puppet.conf
        file { "/etc/puppet/puppet.conf":
                content => template("nixmodule/puppet.conf.erb"),
                owner => root,
                group => root,
                mode => 644,
                ensure => present,
                }

	}
}



}
