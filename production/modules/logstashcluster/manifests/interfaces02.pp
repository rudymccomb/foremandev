#class logstashcluster::interfaces02
#sets ip address configuration for calslgtst02 or second logstash server
# current
#/etc/network/interfaces
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

# The loopback network interface
#auto lo
#iface lo inet loopback

# The primary network interface
#auto eth0

# DHCP not needed
# iface eth0 inet dhcp
#iface eth0 inet static
#address 10.100.24.204
#netmask 255.255.255.0
#network 10.100.24.0
#gateway 10.100.24.1
#broadcast 10.100.24.255
#dns-nameservers 10.100.15.126 10.100.12.21

##migrate to 

class logstashcluster::interfaces02 {

augeas{ "primary_network_interface_eth0" :
    context => "/files/etc/network/interfaces",
    changes => [
        "set auto[child::1 = 'eth0']/1 eth0",
        "set iface[. = 'eth0'] eth0",
        "set iface[. = 'eth0']/family inet",
        "set iface[. = 'eth0']/method loopback",
    ],
}

augeas{ "primary_network_interface_eth0" :
    context => "/files/etc/network/interfaces",
    changes => [
        "set auto[child::1 = 'eth0']/1 eth0",
        "set iface[. = 'eth0'] eth0",
        "set iface[. = 'eth0']/family inet",
        "set iface[. = 'eth0']/method static",
        "set iface[. = 'eth0']/address 10.100.24.204",
        "set iface[. = 'eth0']/netmask 255.255.255.0",
        "set iface[. = 'eth0']/network 10.100.24.0",
        "set iface[. = 'eth0']/gateway 10.100.24.1",
        "set iface[. = 'eth0']/broadcast 10.100.24.255",
        "set iface[. = 'eth0']/dns-nameservers '10.100.15.126 10.100.12.21'",
    ],
}

}
