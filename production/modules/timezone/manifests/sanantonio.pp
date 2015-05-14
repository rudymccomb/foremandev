class timezone::sanantonio{
        #rackspace location
	class { 'timezone':
                region   => 'US',
                locality => 'Mountain',
        }
}
