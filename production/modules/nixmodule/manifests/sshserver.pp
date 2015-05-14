class nixmodule::sshserver {

#installs open-ssh-server
#include ssh::server

class { 'ssh::server':
  options           => {
    'X11Forwarding' => 'no',
    'Protocol' => '2',
  },
}

}
