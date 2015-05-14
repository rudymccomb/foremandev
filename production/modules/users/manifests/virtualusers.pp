class users::virtualusers {

  @user { 'jill':
    ensure => present,
    uid => 200,
    tag => 'ops',
    }


  @user { 'rmccomb':
    ensure           => present,
    uid              => 533
    comment          => 'devops rmccomb',
    home             => '/home/rmccomb',
    groups           => ['wheel', 'users'],
    managehome       => true,
    password         => '$1$gsOuMK7m$ggNJx3h9MWccLWfUWswwD.',
    password_max_age => '99999',
    password_min_age => '0',
    shell            => '/bin/bash',
    tag              => 'devops'
    }

  @user { 'hhuggins':
    ensure           => present,
    uid              => 534
    comment          => 'devops hhuggins',
    home             => '/home/hhuggins',
    groups           => ['wheel', 'users'],
    managehome       => true,
    password         => '$1$gsOuMK7m$ggNJx3h9MWccLWfUWswwD.',
    password_max_age => '99999',
    password_min_age => '0',
    shell            => '/bin/bash',
    tag              => 'devops'
    }

  @user { 'btriol':
    ensure           => present,
    uid              => 550
    comment          => 'sysops btriol',
    home             => '/home/btriol',
    groups           => ['wheel', 'users'],
    managehome       => true,
    #password         => '$1$gsOuMK7m$ggNJx3h9MWccLWfUWswwD.',
    #password_max_age => '99999',
    password_min_age => '0',
    shell            => '/bin/bash',
    tag              => 'sysops'
    }

  @user { 'gmendiola':
    ensure           => present,
    uid              => 535
    comment          => 'sysops gmendiola',
    home             => '/home/gmendiola',
    groups           => ['wheel', 'users'],
    managehome       => true,
    #password         => '$1$gsOuMK7m$ggNJx3h9MWccLWfUWswwD.',
    #password_max_age => '99999',
    password_min_age => '0',
    shell            => '/bin/bash',
    tag              => 'sysops'
    }

  @user { 'rwhite':
    ensure           => present,
    uid              => 535
    comment          => 'sysops rwhite',
    home             => '/home/rwhite',
    groups           => ['wheel', 'users'],
    managehome       => true,
    #password         => '$1$gsOuMK7m$ggNJx3h9MWccLWfUWswwD.',
    #password_max_age => '99999',
    password_min_age => '0',
    shell            => '/bin/bash',
    tag              => 'storage'
    }

  @user { 'jill':
    ensure => present,
    uid => 200
    tag => 'ops'
    }

  include virtualusers
  User <| tag == 'ops' |>

}
