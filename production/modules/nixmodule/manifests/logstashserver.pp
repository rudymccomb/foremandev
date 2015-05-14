class nixmodule::logstashserver{

 	class { 'logstash': 
	 version => '1.4.1_debian'
        }	
}
