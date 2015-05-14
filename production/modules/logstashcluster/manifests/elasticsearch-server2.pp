class logstashcluster::elasticsearch-server2 {


  case $::osfamily {
    'redhat': {
       class { 'elasticsearch':
         #version => '1.2.1',
         config => { 'cluster.name' => 'elasticsearch' },
         package_url => 'https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.2.1.noarch.rpm'
       }
    }

    'debian': {
     class { 'elasticsearch':
       #version => '1.2.1',
       config => { 'cluster.name' => 'elasticsearch' },
       package_url => 'https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.2.1.deb'
     }
    }

  }

  elasticsearch::instance { 'es-02':
    #config => { 'node.name' => 'calslgtst01.foo.com' }
    config => { 'node.name' => "${::fqdn}" }
  }

}
