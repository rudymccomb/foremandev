class pci::disable-avahi {

#disables avahi service
	service { "avahi-daemon":
		ensure => "stopped",
	}


}
