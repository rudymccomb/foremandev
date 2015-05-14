## this manifest should go on a sep (redis) server but can be deployed 
## all on the same box (logstash, redis, elasticsearch, kibana)
## for redis "cluster" deploy to 2 or more ubuntu or centos servers w/sep fqdn/hostname

class logstashcluster::redis-server {

  class { 'redis':
    conf_port => '6379',
    conf_bind => '0.0.0.0',
  }

}
