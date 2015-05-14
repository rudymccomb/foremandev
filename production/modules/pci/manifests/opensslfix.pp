class pci::opensslfix {

  package { 'openssl':
    #ensure => '0.9.8e-27.el5_10.3',
    ensure  => latest,
  }

}
