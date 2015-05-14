#creates upgrade1 db for dev environment
class foo-dev::vmdbcreate-upgrade1 {

#install percona repo
class { 'percona_repo' : } 

#manages percoona server
#class { 'percona':
#    mysql_version => "5.6"
    #root_password => 'dummy_password',
    #wsrep_cluster_address => 'gcomm://192.168.0.1:4010,192.168.0.2:4010',
    #wsrep_cluster_name => 'mycluster'
#}



#mysql_user { 'root@127.0.0.1':
#     ensure  => 'present', 
     # max_connections_per_hour => '0',
     # max_queries_per_hour     => '0',
     # max_updates_per_hour     => '0',
     # max_user_connections     => '0',
# }->
# notify {'mysql_user':
#     message => 'mysql root user created.',
#    }


# mysql::db { 'Upgrade1':
#     user     => 'magento',
#     password => 'magento',
#     host     => 'localhost',
#     grant    => ['ALL' ],
     #require  => Class ["::mysql::server"]
#    }->
# notify {'mysql_db_created':
#     message => 'Upgrade1 mysql db has been created, no db imported at this time',
#    }

}
