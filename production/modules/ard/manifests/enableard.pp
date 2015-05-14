class ard::enableard {

  exec { "kickstartconfig for madmin":
        command => "kickstart -configure -allowAccessFor -specifiedUsers",
        path => "/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/",
        unless => "/usr/sbin/netstat -anp tcp | /usr/bin/grep 5900",
  }

  exec { "kickstartprivs for madmin":
        command => "kickstart -configure -access -on -privs -all -users madmin",
        path => "/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/",
        unless => "/usr/sbin/netstat -anp tcp | /usr/bin/grep 5900",
        require => Exec["kickstartconfig for madmin"],
  }

    exec { "kickstartagentrestart for madmin":
                          command => "kickstart -agent -restart",
                          path => "/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/",
                          unless => "/usr/sbin/netstat -anp tcp | /usr/bin/grep 5900",
                          require => Exec["kickstartprivs for madmin"],
        }



  exec { "kickstartactivate for madmin":
        command => "kickstart -activate",
        path => "/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/",
        unless => "/usr/sbin/netstat -anp tcp | /usr/bin/grep 5900",
        require => Exec["kickstartagentrestart for madmin"],
  }
}
