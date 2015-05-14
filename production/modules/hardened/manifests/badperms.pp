# Class: badperms
#
# Module: badperms
#
# Description:
#	Creates a daily cron job that checks for bad permission settings
#	such as world writable files, sticky bits not set on a+w directories,
#	non-whitelisted suid/guid executables, unowned files, and root ownership
#	for world-writable directories.  This cron job attempts to fix any item
#	found.
#
# Requires: cron must run the cron.daily folder
#
# LinuxGuide
#	2.2.3.2
#	2.2.3.3
#	2.2.3.4
#	2.2.3.5
#	2.2.3.6
#
# CCERef#:
#	CCE-3399-3
#	CCE-3795-2
#	CCE-3324-1
#	CCE-4178-0
#	CCE-4223-4
#	CCE-3573-3
#
# File: /etc/puppet/modules/badperms/manifests/init.pp
#
class hardened::badperms {

	# GuideSections 2.2.3.2 - 2.2.3.6
	file {
		"/etc/cron.daily/badperms.cron":
		owner  => "root",
		group  => "root",
		mode   => 755,
		content => template("hardened/badperms/badperms.cron.erb"),
	}

	# GuideSection 2.4.5
	# Check for Unlableded Device files
	if $unlabeled_dev_count != 0 {
		crit("There are $unlabeled_dev_count files in /dev that have no SELinux label")
	}

}
