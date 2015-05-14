class pci::disable-xinetd {

#disables avahi service
	service { "xinetd":
		ensure => "stopped",
	}


}
