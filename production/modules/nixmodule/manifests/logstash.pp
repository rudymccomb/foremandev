class nixmodule::logstash {

 class { 'logstash': 
   java_install => true
}
