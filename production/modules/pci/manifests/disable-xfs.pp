class pci::disable-xfs {

#disables xfs service
	service { "xfs":
		ensure => "stopped",
	}


}
