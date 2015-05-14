class nixmodule::rmcron {

file { '/etc/cron.d/foreman-email-reports-cron':
                ensure  => 'absent',
                content => "59,17 * * * * root /etc/foreman foreman-rake reports:summarize hours=12 RAILS_ENV='production'",
                mode    => '0644',
                owner   => 'root',
                group   => 'root',
        }

cron { 'foreman_email_reports':
          ensure  => 'absent',
          command => "/usr/sbin/foreman-rake reports:summarize hours=12 RAILS_ENV='production' /etc/foreman",
          user    => 'root',
          hour    => [ 9,17 ],
          minute  => '2',
        }

}
