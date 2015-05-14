class nixmodule::sshserver-sftp {

#installs open-ssh-server
#include ssh::server

class { "ssh::server":
  options           => {
    'X11Forwarding' => 'no',
    'Protocol'      => '2',
    #'ForceCommand'  => 'internal-sftp',
    'Subsystem'     => 'sftp /usr/libexec/openssh/sftp-server',
  },
}

}
