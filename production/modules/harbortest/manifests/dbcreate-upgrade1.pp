#creates upgrade1 db for dev environment
class foo::dbcreate-upgrade1 {

mysql_user { 'root@127.0.0.1':
     ensure  => 'present',
     # max_connections_per_hour => '0',
     # max_queries_per_hour     => '0',
     # max_updates_per_hour     => '0',
     # max_user_connections     => '0',
 }->
 notify {'mysql_user':
     message => 'mysql root user created.',
    }

 mysql_grant { 'root@localhost/*.*':
     ensure     => 'present',
     options    => ['GRANT'],
     privileges => ['ALL'],
     table      => '*.*',
     user       => 'root@localhost',
     #require    => Class ["::mysql::server"]
 }

 mysql::db { 'Upgrade1':
     user     => 'magento',
     password => 'magento',
     host     => 'localhost',
     grant    => ['ALL' ],
     #require  => Class ["::mysql::server"]
    }->
 notify {'mysql_db_created':
     message => 'Upgrade1 mysql db has been created, no db imported at this time',
    }

}
