class macmodule::xcode{

	  #installs boxen
        #exec {'installs boxen':
         # command => "/usr/bin/curl -s https://raw.github.com/gawkermedia/boxen/master/gawker-boxen > /tmp/boxen.sh; bash /tmp/boxen.sh",
          #}
	#installs homebrew
	class { 'homebrew':
 	user => 'madmin',    # Defaults to 'root'
	}

#installs xquartz
#include xquartz
 #class xquartz {
  #package { 'XQuartz':
    #ensure => present,
   # provider => 'pkgdmg',
    #source   => 'http://xquartz.macosforge.org/downloads/SL/XQuartz-2.7.5.dmg',
  #}
#} 
}
