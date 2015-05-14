##
##
class logstashcluster::logstash-server {

  case $::osfamily {
    'redhat': {
       class { 'logstash':
         restart_on_change => true,
	 package_url => 'https://download.elasticsearch.org/logstash/logstash/packages/centos/logstash-1.4.2-1_2c0f5a1.noarch.rpm'
         #install_contrib => true,
         #contrib_package_url => 'https://download.elasticsearch.org/logstash/logstash/packages/centos/logstash-contrib-1.4.2-1_efd53ef.noarch.rpm'
       }
    }

    'debian': {
       class { 'logstash':
         restart_on_change => true,
	 package_url => 'https://download.elasticsearch.org/logstash/logstash/packages/debian/logstash_1.4.2-1-2c0f5a1_all.deb'
         #install_contrib => true,
         #contrib_package_url => 'https://download.elasticsearch.org/logstash/logstash/packages/debian/logstash-contrib_1.4.2-1-efd53ef_all.deb'
       }
    }
  }

  logstash::configfile { 'centralserver':
    source => 'puppet:///modules/logstashcluster/centralserver.conf'
  }

  logstash::configfile { 'syslog':
    source => 'puppet:///modules/logstashcluster/syslog.conf'
  }

  logstash::configfile { '01-rsyslog':
    source => 'puppet:///modules/logstashcluster/01-rsyslog.conf'
  }
}
