#
# Module: consoleperms
#
# Class: consoleperms
#
# Description:
#	This class hardens what a console user can do.
#
# Defines:
#	None
#
# LinuxGuide:
#	2.3.1.1
#	2.2.2.1
#	2.3.3.4
#
# CCERef#:
#	CCE-4209-3
#
class hardened::consoleperms {
  # GuideSection 2.3.1.1
  # CCE-3820-8 CCE-3485-0, CCE-4111-1, CCE-4256-4
  # Restrict console device access
  file { '/etc/securetty':
    owner  => 'root',
    group  => 'root',
    mode   => 600,
    source => 'puppet:///modules/hardened/consoleperms/securetty';
  }

  # GuideSection 2.2.2.1
  # Restrict console device access
  # Comment out each line that starts with <console> or <xconsole>
  exec {
    'Restrict ConsoleDevice Access':
      path    => '/bin/',
      command => "sed -i 's/^<x*console>/#&/g' /etc/security/console.perms.d/50-default.perms",
      user    => root,
      onlyif	=> "grep -E '^<x*console>' /etc/security/console.perms.d/50-default.perms",
  }

  # Replace the console.perms file with a more strict one
  file {
    '/etc/security/console.perms':
      owner  => 'root',
      group  => 'root',
      mode   => 644,
      source => 'puppet:///modules/hardened/consoleperms/console.perms';
  }

  # GuideSection 2.3.3.4
  # Restrict userhelper to console users
  # Not required by USGCB, but a good idea for security.
#	group {
#		'usergroup':
#			ensure => present;
#	}
#
#	file {
#		'/usr/sbin/userhelper':
#			ensure  => present,
#			require => Group[usergroup],
#			group   => usergroup,
#			mode    => 4710;
#	}
}
