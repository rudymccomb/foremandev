class foo::ecomm-devs {

account { 'ekulish':
  ensure     => 'present',
  username   => 'ekulish',
  home_dir   => '/home/ekulish',
  groups     => ['users','wheel'],
  password         => '$1$WyeOvvrE$c8rI9tkebhbc1pEg7Hyc01',
  comment    => 'ecomm dev',
}

sudo::conf { 'ekulish':
        priority => 20,
        content  => "ekulish ALL=(ALL)  ALL",
        ensure   => 'present',
        }

}
