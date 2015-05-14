#Class to run create and run cron jobs

class crons {

cron { 'foreman_email_reports':
          ensure  => 'present',
          command => "/usr/sbin/foreman-rake reports:summarize hours=12 RAILS_ENV='production' /etc/foreman",
          user    => 'root',
          hour    => [ 9,17 ],
          minute  => '2',
        }
	
}

