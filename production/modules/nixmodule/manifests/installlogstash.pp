class nixmodule::installlogstash {

 class { 'logstash':
   #version => '1.4_debian',
   manage_repo => true, 
   repo_version => '1.4', 
 }

}

