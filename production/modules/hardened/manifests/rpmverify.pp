# Module: rpmverify
#
# Class: rpmverify
#
# Description:
#	Sets up a cron job to routinely scan the system for files that rpm -qVa
#	can pick out as different than expected. These files should be diagnosed
#	to see why they changed from expected.
#
# Defines:
#       None
#
# LinuxGuide:
#       2.1.3.1.1
#       2.1.3.1.3
#       2.1.3.1.4
#
# CCERef#:
#       CCE-4209-3
#
# Defines:
#	None
#
# File: /etc/puppet/modules/rpmverify/manifests/init.pp
#
class hardened::rpmverify {

	# GuideSection 2.1.3.2
	# Verify package integrity via rpm
	file {
		"/etc/cron.daily/rpmverify.cron":
			owner  => "root",
			group  => "root",
			mode   => 755,
			source => "puppet:///modules/hardened/rpmverify/rpmverify.cron",
	}

  #cron { 'rpmverify':
	#  ensure  => present,
	#	target  => 'daily',
	#	user    => 'root',
  #  source => "puppet:///modules/rpmverify/rpmverify.cron",

  #}

}
