#Class to run create and run cron jobs

class vmwareconfig {

#include vmwaretools

class { 'vmwaretools':
  version     => '9.0.5-1065307',
  working_dir => '/tmp/vmwaretools',
  fail_on_non_vmware => true,
  #archive_url => 'http://packages.vmware.com/tools/esx/5.1u1/ubuntu/dists/precise/',
  #archive_md5 => '9df56c317ecf466f954d91f6c5ce8a6f',
}

}

