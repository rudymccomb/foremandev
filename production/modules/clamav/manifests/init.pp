#Class to install and configure ClamAV for mac
class clamav {
package {
	"clamav" :
		#ensure => present,
		provider => appdmg,
		source => "http://clamxav.com/downloads/ClamXav_2.6.2.dmg",
}->

file { "/Library/LaunchDaemons/net.clamav.freshclam.plist" :
		owner => root,
		group => wheel,
		source => "puppet:///modules/clamav/net.clamav.freshclam.plist",
}

service { "net.clamav.freshclam" :
				enable => true,
				ensure => 'running',
				subscribe => File["/Library/LaunchDaemons/net.clamav.freshclam.plist"],
				require => File["/Library/LaunchDaemons/net.clamav.freshclam.plist"],
			}
}

