class macmodule::artplotter {

#install epson plotter
        printer { "CALPS01-Packplot01":
                ensure      => present,
                description => "CALPS01-Packplot01",
                enabled     => true,
                accept      => true,
                location    => "Calabasas ART",
                ppd         => "/Library/Printers/PPDs/Contents/Resources/EPSON Epson Stylus Pro 9890.gz",
                uri         => "lpd://10.100.50.70",
                    }
}
