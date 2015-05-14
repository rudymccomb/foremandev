class macmodule::testfile{

        #create home folder directory
        file { '/Users/shared/test':
                ensure     => 'directory',
        }

        # Just verify file permissions.
        file { "/Users/shared/RestrictedFile.txt":
                mode => 755,
                ensure => present,
                content => "Nobody read the contents of this file.",
                }
}
