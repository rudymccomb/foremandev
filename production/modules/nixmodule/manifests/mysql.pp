class nixmodule::mysql {

#include  '::mysql::server'

class { '::mysql::server':
#   root_password => 'strongpassword',
#   override_options => { 'mysqld => { 'max_connections' => '1024'}}
  }


mysql_user { 'root@127.0.0.1':
  ensure                   => 'present',

 # max_connections_per_hour => '0',
 # max_queries_per_hour     => '0',
 # max_updates_per_hour     => '0',
 # max_user_connections     => '0',
}

mysql_grant { 'root@localhost/*.*':
  ensure     => 'present',
  options    => ['GRANT'],
  privileges => ['ALL'],
  table      => '*.*',
  user       => 'root@localhost',
#  require    => Class ["::mysql::server"]
}

 mysql::db { 'stash':
     user     => 'stashuser',
     password => 'stashuser',
     host     => 'localhost',
     grant    => ['ALL' ],
     table    => 'stash.*',
    }

exec { 'flush privileges':
   command   => "/usr/bin/mysql -h localhost.localdomain -u root -p -e \"USE stash; flush privileges;\"",
   #require => Exec ["update_base_media_url-default"]
  }

}
