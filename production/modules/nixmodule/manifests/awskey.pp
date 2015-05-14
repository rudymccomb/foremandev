class nixmodule::awskey{

#file { "/home/ec2-user/.ssh/authorized_keys/puppet.conf":
#                content => template("nixmodule/puppet.conf.erb"),
#                ensure => present,
#                }

sudo::conf { 'rmccomb':
        priority => 10,
        content  => "rmccomb ALL=(ALL)  ALL",
        ensure   => 'present',
        }

account { 'rmccomb':
        ensure   => 'present',
        username => 'rmccomb',
        home_dir => '/home/rmccomb',
        password => '$1$gsOuMK7m$ggNJx3h9MWccLWfUWswwD.',
        #create_group => 'sudo',
	ssh_key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCuD7byEBLZECxrWAw2qLi1qxi+oSevICwHyz+KOC3S75PIOhurZ56DdpgQUNmJKJdxlIqb+MMdj48kA3jSMOkc6KjV52HxtBkDErU2F2WH1fOL6/8M8QpNtu4ApjrcEBNdQrwYGFNpsyhT516QednxMKnhagsIwsepLTHWqojyQZ4QaOyEfZ2DZEiqHyCyeUCyLufSWvmu6LA6SpzHeO37WGaJeEnohQGiu9iEZaP5daDJTRUY+FzLoar31bQnVxftdjTFyg+Z7Hk89X4ACTVFfuJVecsuySVm56fVsrlEOY+xAmJGCanYkWaZ09ZZxik0PhOCuKqhlfcXFWG95DpZ rmccomb@cabimd011214.foo.com',
        groups   => [ 'users','wheel' ],
        comment   => 'devops rmccomb',
        }



}
