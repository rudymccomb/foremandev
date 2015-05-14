#
# Module: auditd
#
# Class: auditd
#
# Description:
# 	This class configures the auditd daemon on a system
#
# Defines:
# 	None
#
# LinuxGuide:
# 	2.6.2.1
# 	2.6.2.3
# 	2.6.2.4
# 	2.6.2.4.1
# 	2.6.2.4.2
# 	2.6.2.4.3
# 	2.6.2.4.4
# 	2.6.2.4.5
# 	2.6.2.4.6
# 	2.6.2.4.7
# 	2.6.2.4.8
# 	2.6.2.4.9
# 	2.6.2.4.10
# 	2.6.2.4.11
# 	2.6.2.4.12
# 	2.6.2.4.13
#
# CCERef#:
# 	CCE-4292-9
#
# Variables:
# 	None
#
# Facts:
# 	$architecture Used to pull the appropiate rules for the system
#
# TODO:
# 	1. Would be nice to turn this into a type, so rules can be
# 	added easier on the fly.
# 	2. We dont edit/look at auditd.conf file maybe we should?
class hardened::auditd {
  # GuideSection 2.6.2.1
  # CCE-4292-9
  # ensures the auditd service is installed but disabled by default per eamos of infosec
  package { 'audit':
    ensure => installed;
  }

  service {
    'auditd':
      ensure     => stopped,
      enable     => false,
      hasstatus  => true,
      hasrestart => true,
      require    => Package['audit'],
  }

  # GuideSection 2.6.2.4.*
  # Configure default comprehensive rules
  file {
                '/etc/audit/audit.rules':
                owner   => 'root',
                group   => 'root',
                mode    => 600,
    source  => $architecture? {
                	x64     => 'puppet:///modules/hardened/auditd/audit.rules.64',
      default => 'puppet:///modules/hardened/auditd/audit.rules.386',
    },
    require => Package['audit'],
    notify  => Service['auditd'],
        }

}
