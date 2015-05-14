class crons::puppetcron {
	#$min1 = fqdn_rand(30)
	#$min2 = $min1 + 30

	#file { '/etc/cron.d/puppet-cron':
  #		ensure  => 'absent',
  #		content => "$min1,$min2 * * * * root /usr/bin/puppet agent --no-daemonize --onetime\n",
  #		mode    => '0644',
  #		owner   => 'root',
  #		group   => 'root',
	#}

	#cron { 'puppet':
	#	ensure => 'absent',
	#}

	cron { 'puppet-agent':
  		ensure  => 'present',
  		command => '/usr/bin/puppet agent --onetime --no-daemonize --splay --logdest syslog > /dev/null 2>&1',
  		minute  => ['30'],
  		target  => 'root',
  		user    => 'root',
	}

}
