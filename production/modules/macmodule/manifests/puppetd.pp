class macmodule::puppetd {

	 # Puts /etc/puppet/modules/macmodule/files/com.puppetlabs.puppet.plist on the client.
        # On the client, it's going into /Library/LaunchDaemons/com.puppetlabs.puppet.plist
        file { "/Library/LaunchDaemons/com.puppetlabs.puppet.plist":
		notify => Service["com.puppetlabs.puppet"],
                source => "puppet:///modules/macmodule/com.puppetlabs.puppet.plist",
                owner => "root",
                group => "wheel",
                mode => "0644",
                ensure => file,
                }

   	service { 'com.puppetlabs.puppet':
                enable    => true,
                ensure    => 'running',
        }

#sets group for puppet to use
group { 'puppet':
  ensure => "present",
}

#sets user for puppet
user { 'puppet':
  ensure     => "present",
  comment    => "puppet",
  gid        => "495",
  iterations => "40816",
  password   => "d5b8da59136ebca0c8bc3f64d4267685fc5bae38792cea69c5215eb95e85ba547cdde25ff82d390b8a572917f4e06a0e1a3b8fbced3f160725031211c89ce7d02cc3be08141a19684c6e15ee512fe539fce610e03fd80c08d94f3f4cd1a03ed2e38f85907f33a811611512413e5e4a8765c89b86cb872f6ef89d28edb069434d",
  salt       => "20720cb403cf0d4680a67269d9a785b1a1c0662ce5d338b96359de8dc02a2bfe",
  shell      => "/sbin/nologin",
  uid        => "52",
}

}
