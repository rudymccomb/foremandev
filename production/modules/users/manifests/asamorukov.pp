# class users::asamorukov manages user account for alexey samorukov
class users::asamorukov {

  #class { 'sudo':}

  sudo::conf { 'asamorukov':
    ensure   => 'present',
    priority => 10,
    content  => 'asamorukov ALL=(ALL)  ALL',
  }



  case $::osfamily {
  'redhat': {
    #redhat specific

  user { 'asamorukov':
    ensure           => 'present',
    comment          => 'ecomm dev asamorukov',
    #gid              => '555',
    groups           => [ 'users','wheel' ],
    home             => '/home/asamorukov',
    managehome       => true,
    #password         => '$1$4qGCBzdd$yQzQRkQ9HwUq1cyiod/hc0',
    password_max_age => '99999',
    password_min_age => '0',
    shell            => '/bin/bash',
    system           => false,
    #create_group => 'sudo',
    #uid              => '555',
    }
  }

  'debian': {
  #redhat specific

  user { 'asamorukov':
    ensure           => 'present',
    home             => '/home/asamorukov',
    groups           => [ 'sudo','adm' ],
    comment          => 'director asamorukov',
    managehome       => true,
    password_max_age => '99999',
    password_min_age => '0',
    shell            => '/bin/bash',
    }
  }

  }
}
