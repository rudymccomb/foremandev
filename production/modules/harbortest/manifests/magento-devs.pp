class foo::magento-devs {
#
#rgarcia
#wkrzyzowski
#ozarichnyi
#vbondarenko
#dgergun
#alaguta
#kschroeder


account { 'rgarcia':
  ensure     => 'present',
  username   => 'rgarcia',
  home_dir   => '/home/rgarcia',
  groups     => ['users','wheel'],
  password         => '$1$WyeOvvrE$c8rI9tkebhbc1pEg7Hyc01',
  comment    => 'ecomm dev',
}

sudo::conf { 'rgarcia':
        priority => 20,
        content  => "rgarcia ALL=(ALL)  ALL",
        ensure   => 'present',
        }

account { 'wkrzyzowski':
  ensure     => 'present',
  username   => 'wkrzyzowski',
  home_dir   => '/home/wkrzyzowski',
  groups     => ['users','wheel'],
  password         => '$1$WyeOvvrE$c8rI9tkebhbc1pEg7Hyc01',
  comment    => 'ecomm dev',
}

sudo::conf { 'wkrzyzowski':
        priority => 20,
        content  => "wkrzyzowski ALL=(ALL)  ALL",
        ensure   => 'present',
        }

account { 'ozarichnyi':
  ensure     => 'present',
  username   => 'ozarichnyi',
  home_dir   => '/home/ozarichnyi',
  groups     => ['users','wheel'],
  password         => '$1$WyeOvvrE$c8rI9tkebhbc1pEg7Hyc01',
  comment    => 'ecomm dev',
}

sudo::conf { 'ozarichnyi':
        priority => 20,
        content  => "ozarichnyi ALL=(ALL)  ALL",
        ensure   => 'present',
        }

account { 'vbondarenko':
  ensure     => 'present',
  username   => 'vbondarenko',
  home_dir   => '/home/vbondarenko',
  groups     => ['users','wheel'],
  password         => '$1$WyeOvvrE$c8rI9tkebhbc1pEg7Hyc01',
  comment    => 'ecomm dev',
}

sudo::conf { 'vbondarenko':
        priority => 20,
        content  => "vbondarenko ALL=(ALL)  ALL",
        ensure   => 'present',
        }

account { 'dgergun':
  ensure     => 'present',
  username   => 'dgergun',
  home_dir   => '/home/dgergun',
  groups     => ['users','wheel'],
  password         => '$1$WyeOvvrE$c8rI9tkebhbc1pEg7Hyc01',
  comment    => 'ecomm dev',
}

sudo::conf { 'dgergun':
        priority => 20,
        content  => "dgergun ALL=(ALL)  ALL",
        ensure   => 'present',
        }

account { 'alaguta':
  ensure     => 'present',
  username   => 'alaguta',
  home_dir   => '/home/alaguta',
  groups     => ['users','wheel'],
  password         => '$1$WyeOvvrE$c8rI9tkebhbc1pEg7Hyc01',
  comment    => 'ecomm dev',
}

sudo::conf { 'alaguta':
        priority => 20,
        content  => "alaguta ALL=(ALL)  ALL",
        ensure   => 'present',
        }

account { 'kschroeder':
  ensure     => 'present',
  username   => 'kschroeder',
  home_dir   => '/home/kschroeder',
  groups     => ['users','wheel'],
  password         => '$1$WyeOvvrE$c8rI9tkebhbc1pEg7Hyc01',
  comment    => 'ecomm dev',
}

sudo::conf { 'kschroeder':
        priority => 20,
        content  => "kschroeder ALL=(ALL)  ALL",
        ensure   => 'present',
        }

}
