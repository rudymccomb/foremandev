class macmodule::clr04 {
  
 package { 'ArtClr04Fierydriver':
    ensure   => present,
    provider => appdmg,
    source   => 'smb://FOOdata02/corpshare/PrintDrivers/RicohPrintDrivers/Mac_Print_Drivers/Install\ ricoh\ Drivers/clr04/z56585L6.dmg',
  }
}
