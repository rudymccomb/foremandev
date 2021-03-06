#
# Module: bootup
#
# Class: bootup
#
# Description:
#       This class will harden the bootup process.
#
# Defines:
#       None
#
# LinuxGuide:
#       2.3.5.2
#       2.3.5.3
#       2.3.5.4
#
# CCERef#:
#       CCE-3923-0
#	CCE-4144-2
#	CCE-4197-0
#	CCE-3923-0
#	CCE-4245-7
#
class hardened::bootup {
	# GuideSection 2.3.5.3
	# CCE-3923-0
	# Requires authentication for single user mode
	augeas { "Req Auth Single boot, 2.3.5.3":
		context    => "/files/etc/inittab",
    changes => [
			"set ~/runlevels S",
			"set ~/action wait",
			"set ~/process '/sbin/sulogin'",
		]
	}

	# GuideSection 2.3.5.4
	# CCE-4245-7
	# Disables interactive boot
	augeas { "DisableInteractiveBoot":
		context => "/files/etc/sysconfig/init",
		changes => "set PROMPT no"
	}

	# GuideSection 2.3.5.2
	# CCE-4144-2, CCE-4197-0, CCE-3923-0
	file { "/etc/grub.conf":
		owner => 'root',
		group => 'root',
		mode  => '600';
	}
}
