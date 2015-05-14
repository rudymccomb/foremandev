# Public: Install updates from Apple
class macmodule::software_update {


  exec { 'osx_software_update':
      command  => '/usr/sbin/softwareupdate -i -a',
      schedule => 'update_schedule',
      timeout  => 0,
      user     => 'root'
  }

  schedule { 'update_schedule':
    weekday => 'Monday',
    range =>  '09:55-23:58',
    repeat => 3 
  }


#   if sp_os_version == "OS X 10.9.0" {
#	exec { 'reboot_mac':
 #    	command => '/sbin/shutdown -r +2',
  #   	require => Exec ["osx_software_update"]
#	}
#
#	}

       
 #  elsif sp_os_version == "OS X 10.9.2" {
 #	notify{'This Mac is already up to date':}
#	}



#if sp_os_version == "OS X 10.9.1" {
#        exec { 'reboot_mac':
#        command => '/sbin/shutdown -r +2',
#        require => Exec ["osx_software_update"]
#        }

#        }


#   elsif sp_os_version == "OS X 10.9.2" {
#        notify{'This Mac is already up to date':}
#        }

 # exec { 'reboot_mac':
 #       command => '/sbin/shutdown -r +2',
 #       require => Exec ["osx_software_update"]
  #      }


}
