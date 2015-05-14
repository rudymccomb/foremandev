class logstashcluster::curator {

cron { 'curator-delete':
    ensure  => 'present',
    command => '/usr/local/bin/curator delete --older-than 10',
    hour    =>  2,
    minute  =>  30,
    target  => 'root',
    user    => 'root',
}

}
