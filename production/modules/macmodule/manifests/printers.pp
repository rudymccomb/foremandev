class macmodule::printers {

	#file {'/Library/Printers/PPDs/Contents/Resources/RICOH Aficio SP C811DN':
    	#	ensure => file,
    	#	mode   => '0655',
    	#	owner  => 'root',
    	#	group  => '_lp',
    	#	source => 'puppet:///modules/osx_management/RICOH Aficio SP C811DN',
    	#	before => Printer['CALPS-ARTCLR03'],
  	#	     }


	#creates printers on mac
        printer { "CALPS01-ARTCLR03":
                ensure      => present,
		description => "CALPS01-ARTCLR03",
                enabled     => true,
                accept	    => true,
                location    => "Calabasas ART",
                ppd         => "/Library/Printers/PPDs/Contents/Resources/RICOH Aficio SP C811DN",
                uri         => "lpd://10.100.50.32",
                    }

 	#creates printers on clr04
        printer { "CALPS01-ARTCLR04":
                ensure      => present,
                description => "CALPS01-ARTCLR04",
                enabled     => true,
                accept      => true,
                location    => "Calabasas ART",
                ppd         => "/Library/Printers/PPDs/Contents/Resources/en.lproj/C751(EX)-C651EX E-41A PS 1.2",
                uri         => "lpd://10.100.50.36",
                    }

   #installs replenishclr01 ecomm
        printer { "CALPS01-REPLENISHCLR01":
                ensure      => present,
                description => "CALPS01-REPLENISHCLR01",
                enabled     => true,
                accept      => true,
                location    => "Ecomm Replenish",
                ppd         => "/Library/Printers/PPDs/Contents/Resources/RICOH Aficio MP C4502",
                uri         => "lpd://10.100.50.22",
                    }

 #installs catman2 ecomm
        printer { "CALPS01-CATMAN2":
                ensure      => present,
                description => "CALPS01-CATMAN2",
                enabled     => true,
                accept      => true,
                location    => "Ecomm catman2",
                ppd         => "/Library/Printers/PPDs/Contents/Resources/RICOH Aficio MP C6501",
                uri         => "lpd://10.100.50.14",
                    }

 #installs catman1 pkg n art
        printer { "CALPS01-CATMAN1":
                ensure      => present,
                description => "CALPS01-CATMAN1",
                enabled     => true,
                accept      => true,
                location    => "Art and Packaging",
                ppd         => "/Library/Printers/PPDs/Contents/Resources/RICOH Aficio MP C6501",
                uri         => "lpd://10.100.50.54",
                    }

 #installs qa printer for mac users
        printer { "CALPS01-QA07":
                ensure      => present,
                description => "CALPS01-QA07",
                enabled     => true,
                accept      => true,
                location    => "QA",
                ppd         => "/Library/Printers/PPDs/Contents/Resources/RICOH Aficio MP C4500",
                uri         => "lpd://10.102.50.17",
                    }

        #removes faulty ricoh ppd file
        exec { 'remove file':
        path => "/Library/Printers/RICOH/PDEs/",
        command => "/bin/rm -rf /Library/Printers/RICOH/PDEs/EF115057\ \(FF\).plugin",
          }
}
