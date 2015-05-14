class macmodule::FOOprinters {
       # file {'/private/etc/cups/ppd/CALPS01_ARTCLR04.ppd':
    	#	ensure => file,
    	#	mode   => '0655',
    	#	owner  => 'root',
    	#	group  => '_lp',
    	#	source => 'puppet:///modules/macmodule/CALPS01_ARTCLR04.ppd',
    	#	before => Printer['CALPS01-ARTCLR04'],
  	#		}

	 #creates itprinter
        printer { "CALPS01-IT02":
                ensure      => present,
                description => "CALPS01-IT02",
                enabled     => true,
                accept      => true,
                location    => "Help Desk",
                ppd         => "/Library/Printers/PPDs/Contents/Resources/RICOH Aficio MP C300SR",
                uri         => "lpd://10.100.50.21",
                    }
                    
                    
        #creates itprinter at break room
        printer { "CALPS01-TreeKiller":
                ensure      => present,
                description => "CALPS01-TreeKiller",
                enabled     => true,
                accept      => true,
                location    => "IT Break Room",
                ppd         => "/Library/Printers/PPDs/Contents/Resources/RICOH Aficio MP C5000",
                uri         => "lpd://10.100.50.19",
                    }
                    
                    
        #creates itprinter cio office
        printer { "CALPS01-ITCLR01":
                ensure      => present,
                description => "CALPS01-ITCLR01",
                enabled     => true,
                accept      => true,
                location    => "CIO Office",
                ppd         => "/Library/Printers/PPDs/Contents/Resources/RICOH Aficio SP C430DN",
                uri         => "lpd://10.100.50.20",
                    }

	#installs artclr03
        printer { "CALPS01-ARTCLR03":
                ensure      => present,
		description => "CALPS01-ARTCLR03",
                enabled     => true,
                accept	    => true,
                location    => "Calabasas ART",
                ppd         => "/Library/Printers/PPDs/Contents/Resources/RICOH Aficio SP C811DN",
                uri         => "lpd://10.100.50.32",
                    }

 	#installs artclr04
        printer { "CALPS01-ARTCLR04":
                ensure      => present,
                description => "CALPS01-ARTCLR04",
                enabled     => true,
                accept      => true,
                location    => "Calabasas ART",
                ppd         => "/Library/Printers/PPDs/Contents/Resources/en.lproj/C751(EX)-C651EX E-41A PS 1.2",
                uri         => "lpd://10.100.50.36",
                    }


	#install epson plotter
	printer { "CALPS01-Payroll01":
                ensure      => present,
                description => "CALPS01-Payroll01",
                enabled     => true,
                accept      => true,
                location    => "Calabasas Payroll",
                ppd         => "/Library/Printers/PPDs/Contents/Resources/RICOH Aficio MP C4502",
                uri         => "lpd://10.100.50.48",
                    }
                    
                    
        #installs replenishclr01 ecomm
        printer { "CALPS01-REPLENISHCLR01":
                ensure      => present,
		description => "CALPS01-REPLENISHCLR01",
                enabled     => true,
                accept	    => true,
                location    => "Ecomm Replenish",
                ppd         => "/Library/Printers/PPDs/Contents/Resources/RICOH Aficio MP C4502",
                uri         => "lpd://10.100.50.22",
                    }
                    
                    
        #installs purchasing ecomm
        printer { "CALPS01-PurchasingCLR02":
                ensure      => present,
		description => "CALPS01-PurchasingCLR02",
                enabled     => true,
                accept	    => true,
                location    => "Ecomm Purchasing",
                ppd         => "/Library/Printers/PPDs/Contents/Resources/RICOH Aficio MP C6501",
                uri         => "lpd://10.100.50.11",
                    }

        #removes faulty ricoh ppd file
        exec { 'remove file':
        path => "/Library/Printers/RICOH/PDEs/",
        command => "/bin/rm -rf /Library/Printers/RICOH/PDEs/EF115057\ \(FF\).plugin",
          }
}
