class users::rackspaceadmins {

#class { 'sudo':}

  sudo::conf { 'rack':
        priority => 11,
        content  => "rack ALL=(ALL)  ALL",
        ensure   => 'present',
        }

  sudo::conf { 'linuxsupport':
        priority => 11,
        content  => "%Linux-Support ALL=(ALL)  ALL",
        ensure   => 'present',
        }

sudo::conf { '884630-Admins':
      priority => 11,
      content  => "%884630-Admins ALL=(ALL)  ALL #foo Admins",
      ensure   => 'present',
      }

}


#-## Administrative access for Rackspace support account
#-rack ALL=(ALL) ALL
#-
#-%Linux-Support   ALL=(ALL) ALL
#-%884630-Admins ALL=(ALL) ALL #foo Admins
#-%884630-Admins ALL=(ALL) ALL #foo Admins



#--- /etc/sudoers	2014-09-08 00:43:13.152639576 -0400
#+++ /tmp/puppet-file20140909-34227-19rvxlt-0	2014-09-09 23:44:29.520993067 -0400
#@@ -63,10 +63,7 @@

 #
 # Preserving HOME has security implications since many programs
#-# use it when searching for configuration files. Note that HOME
#-# is already set when the the env_reset option is enabled, so
#-# this option is only effective for configurations where either
#-# env_reset is disabled or HOME is present in the env_keep list.
#+# use it when searching for configuration files.
 #
 #Defaults    always_set_home

#@@ -116,11 +113,3 @@

 ## Read drop-in files from /etc/sudoers.d (the # here does not mean a comment)
 #includedir /etc/sudoers.d
#-
#-## Administrative access for Rackspace support account
#-rack ALL=(ALL) ALL
#-
#-%Linux-Support   ALL=(ALL) ALL
#-%884630-Admins ALL=(ALL) ALL #foo Admins
#-%884630-Admins ALL=(ALL) ALL #foo Admins
#-eamos           ALL=(ALL)       ALL
