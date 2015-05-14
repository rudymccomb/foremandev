class ard::disableard {

  exec { "arddeactivate for all":
        command => "kickstart -deactivate -configure -access -off",
        path => "/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/",
        onlyif => "/usr/sbin/netstat -anp tcp | /usr/bin/grep 5900",
        #require => Exec["kickstartagentrestart for madmin"],
  }

}

#sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -deactivate -configure -access -off
