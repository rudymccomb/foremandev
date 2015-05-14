#Puppet module to enable Apple Remote Desktop on client machines.
#Only "admin" user will be able to manage the node.

class installrvm {

include rvm

include git
include apache

# apache::vhost { 'calmukprd01.foo.com.80':
#      port    => '80',
      #ip => '10.100.15.184',
#      docroot => '/var/www/munki_repo',
      #docroot_owner	=> 'www-data',
#      docroot_group	=> 'www-data',
#      override   	=> 'all',
      #serveraliases	=> ['calmukprd01.foo.com'],
#      directories => [ { path => '/var/www/munki_repo', options => ['FollowSymLinks','Includes'],  allow_override => ['All'] } ],
#   }

#file { '/var/www/munki_repo':
#  ensure => 'link',
#  target => '/usr/share/munki_repo',
#}

rvm::system_user { rmccomb: ; }

if $rvm_installed == "true" {
 
rvm_system_ruby {
  'ruby-2.1.1':
    ensure      => 'present',
    default_use => false;
    #build_opts  => ['--binary'];
  'ruby-2.0':
    ensure      => 'present',
    default_use => false;
  'ruby-1.9.3':
    ensure      => 'present',
    default_use => true;

}

rvm_gemset {
  'ruby-1.9.3@munkiserver':
    ensure  => present,
    require => Rvm_system_ruby['ruby-1.9.3'];
}

rvm_gem {
  'ruby-1.9.3@munkiserver/bundler':
    ensure  => 'latest',
    require => Rvm_gemset['ruby-1.9.3@munkiserver'];
}

rvm_alias {
  'munkiserver':
    target_ruby => 'ruby-1.9.3@munkiserver',
    ensure      => present,
    require     => Rvm_gemset['ruby-1.9.3@munkiserver'];
}
# ensure rvm doesn't timeout finding binary rubies
# the umask line is the default content when installing rvm if file does not exist
#file { '~/.rvmrc':
#  content => 'umask u=rwx,g=rwx,o=rx
#              export rvm_max_time_flag=20',
#  mode    => '0664',
#  before  => Class['rvm'],
#}


#}
}

file { "/usr/share/munki_repo":
	ensure		=> "directory",
	recurse		=> "true",
	owner		=> "www-data",
	group		=> "www-data",
	mode		=> 777,
	require		=> Class ["apache"]
}

file { "/var/www/munki_repo":
        #ensure          => "directory",
        recurse         => "true",
	ensure => 'link',
        target => '/usr/share/munki_repo',
        owner           => "www-data",
        group           => "www-data",
        mode            => 777,
        require         => Class ["apache"]
}

class { '::samba::server':
  workgroup            => 'WORKGROUP',
  server_string        => 'Samba Server',
  netbios_name         => 'ubuntu',
  interfaces           => [ 'lo', 'eth0' ],
  #hosts_allow          => [ '127.', '192.168.' ],
  local_master         => 'yes',
  map_to_guest         => 'bad user',
  #os_level             => '50',
  #preferred_master     => 'yes',
  #extra_global_options => [
   # 'printing = BSD',
   # 'printcap name = /dev/null',
  #],
  shares => {
    #'homes' => [
    #  'comment = Home Directories',
    #  'browseable = no',
    #  'writable = no',
    #],
    'munkiserver' => [
      'comment = munki_repo',
      'path = /usr/share/munki_repo',
      'browseable = yes',
      'valid user = itmunki',
      'writable = yes',
      'guest ok = yes',
      'read only = no',
      'available = yes',
    ],
  },
  selinux_enable_home_dirs => true,
}



}
