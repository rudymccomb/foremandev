class nixmodule::percona {
 

account { 'v_mcoburn':
    ensure   => 'absent',
    username => 'v_mcoburn',
    home_dir => '/home/v_mcoburn',
    groups   => [ 'users','wheel' ],
    password => '$1$J3qpc9JZ$E8KdUkoAWscCIv5LqZrZV0',
    #ssh_key_type => 'ssh-rsa',
    comment   => 'percona mysql tech support acct',
    #notify => Class['::fooacl'],

}

sudo::conf { 'v_mcoburn':
        priority => 10,
        content  => "v_mcoburn ALL=(ALL)  NOPASSWD: ALL",
        ensure   => 'absent',
        }
# ecomm-devs
#fooacl::conf { 'foo':
#  target => [
#    '/var/www/www.foo.com',
#    '/var/www/ssl.www.foo.com',
#    '/var/www/ssl.shop.foo.com',
#  ],
#  permissions => [
#    'user:akosyriev:rwX',
#    'user:test1:rwX',
#  ],
#}

#  class { 'sudo':
#      purge               => false,
#      config_file_replace => false,
#    }

# sudo::conf { 'admins':
#      priority => 10,
#      content  => "%admins ALL=(ALL) NOPASSWD: ALL",
#      require => Class['sudo'],
#    }

}
