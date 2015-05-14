#this runs a scrub on the db every night at 3am on foo hfd1 (db master)
#this will ensure that any db imports get scrubbed and remain free of customer data
class crons::dbscrub {

cron { 'customer_db_scrub':
          ensure  => 'present',
          command => "/usr/sbin/",
          user    => 'root',
          hour    => 3,
          minute  => '2',
        }

}

#php sdaa

#php /tmp/db
