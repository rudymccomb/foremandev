class nixmodule::rmpuppetlock {
    #cron to remove puppet.lock on rhel 5 boxes
    #this is a temp fix until puppet 3.7 comes out in september

    cron { rm-puppetlock:
      command => "/bin/rm -fr /var/lib/puppet/state/agent_catalog_run.lock",
      ensure  => present,
      user    => root,
      minute  => '29'
    }


}
