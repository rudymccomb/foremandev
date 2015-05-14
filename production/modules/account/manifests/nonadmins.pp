class account::nonadmins {
 

account { 'akosyriev':
    ensure   => 'present',
    username => 'akosyriev',
    home_dir => '/home/akosyriev',
    groups   => [ 'users','wheel' ],
    #password => '123123q',
    #ssh_key_type => 'ssh-rsa',
    #ssh_key  => 'AAAAB3NzaC1yc2EAAAABJQAAAQEAuZFs5jck632qWRM5jecUu038POdnlPxYvv2tIRp+pGexMAjpAsTecl4VeqotH3EvHKhzKESMEThI+vVU4elXaqd9JnsHgkJM4HAaf2ETgzK6589DxeCD005sG5XEZc8mrPqIV2N/9nrV8wrux+106pQSSG5Vn8L9uznDHGhz5DjAKz59raSS3cPCRZ+csHd7X1JyaCr9GtArh3OWcMqpoT8FxP91NFF3zwmTa1uFlAdns4FMGwDqYqdXEQjgrP5TPmkp1k5tPrGsJSFXBCq35591MxBjLzSDDyv1aFs5DtjYLiPdX55NIyAlBPvTfdlouBNcopS+UTwOqTGh/AtMaQ==akosyriev',
    comment   => 'non admin ecomm dev anton kosyriev',
    #notify => Class['::fooacl'],

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

}
