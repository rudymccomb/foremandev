#
# Module: avahi
#
# Class: avahi
#
# Description:
#    This class disables avahi and removes the corresponding firewall rule.
#
# Defines:
#	None
#
# LinuxGuide:
#	3.7.1.1
#	3.7.1.2
#	2.1.3.1.4
#
# CCERef#:
#	CCE-4365-3
#
class hardened::avahi {
  # GuideSection 3.7.1.1
  # CCE-4365-3
  package { 'avahi':
    ensure => present,
  }

  #package { 'avahi-libs':
  #  ensure => absent,
  #}

  # Disable avahi server
  service { 'avahi-daemon':
      ensure    => stopped,
      enable    => false,
      hasstatus => true,
  }

  # GuideSection 3.7.1.2
  # Remove firewall rule
  # No need to remove this FW rule since all rules are managed by fw module
  #augeas::basic-change {
  #	"Avahi-Firewall, 3.7.1.2":
  #		file    => "/etc/sysconfig/iptables",
  #		lens    => "iptables.lns",
  #		changes => "remove *[append = 'RH-Firewall-1-INPUT']/*[protocol = 'udp'][dport = '5353'][jump = 'ACCEPT']"
  #      }
}
