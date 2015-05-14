# Module: ssh
#
# Description:
#	The ssh module configures the /etc/ssh/sshd_config file to add some
#	rules that limit the clients logging into an ssh server.
#
# Linux Guide:
#	3.5.2
#	3.5.2.1, 3.5.2.3, 3.5.2.4, 3.5.2.5, 3.5.2.6, 3.5.2.7, 3.5.2.8
#
# CCE Reference:
#	CCE-3660-8, CCE-3845-5, CCE-4325-7, CCE-4370-3, CCE-4387-7,
#	CCE-4431-3, CCE-4475-0
#
# TODO:
#	Some setting in /manifests/settings.pp could determine whether to use
#	sshd at all.  And if so select one set of rules disabling sshd, and
#	if not, select the other set of rules currently enforced.
#
#	Tightening down iptables rules would also be recommended.
#	Guide 3.5.2.9
#
class hardened::ssh {
	# GuideSection
	# 3.5.2 3.5.2.1 3.5.2.3 3.5.2.4 3.5.2.5 3.5.2.6 3.5.2.7 3.5.2.8
	# Configure ssh server
	augeas { "configure_sshd":
    context => "/files/etc/ssh/sshd_config",
    changes =>   [
		    "set PasswordAuthentication yes",
        "set UsePam yes",
				"set Protocol 2",
				"set ClientAliveInterval 0",
				"set ClientAliveCountMax 0",
				"set IgnoreRhosts yes",
				"set RhostsRSAAuthentication no",
				"set HostbasedAuthentication no",
				"set PermitRootLogin no",
				"set PermitEmptyPasswords no",
				"set Banner /etc/issue",
				"set PermitUserEnvironment yes",
				"set Ciphers aes128-ctr,aes192-ctr,aes256-ctr",
				"set X11Forwarding no",
				"set LogLevel INFO",

    ],
  require => Package["openssh-server"],
  notify  => Service["sshd"]
  }


  package { "openssh-server":
    ensure => latest,
		}

  service { "sshd":
	  ensure => "running",
    enable => "true",
		#subscribe => File["/etc/ssh/sshd_config"],
    require => Package["openssh-server"],
  }


# manage firwalls/iptables
  firewall { '100 allow ssh:22':
    state => ['NEW'],
    #ensure => present,
    dport => '22',
    proto => 'tcp',
    #jump  => 'ACCEPT',
	  action => accept,
  }

}
