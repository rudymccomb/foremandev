#Class to activate Airports only when a cable is not connected and viceversa

class airportswitch {
	
	file {
		"/System/Library/LaunchAgents/com.mine.toggleairport.plist":
			ensure => present,
			owner => "root",
			group => "wheel",
			mode => "644",
			source => "puppet:///modules/airportswitch/com.mine.toggleairport.plist";
	}
	
	file {
		"/Library/Scripts/toggleAirport.sh":
			ensure => present,
			owner => "root",
			group => "wheel",
			mode => "755",
			source => "puppet:///modules/airportswitch/toggleAirport.sh";
	}	
}
