#Puppet module to enable Apple Remote Desktop on client machines.
#Only "admin" user will be able to manage the node.

class sshosx {

 service { "com.openssh.sshd":
                enable    => true,
                ensure    => 'running',
                #subscribe => File["/System/Library/LaunchDaemons/ssh.plist"],
                #require   => File["/System/Library/LaunchDaemons/ssh.plist"],
        }

}
