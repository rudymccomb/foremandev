class nixmodule::testfile{

     #verify the file permissions
     file { "/usr/share/testfile.txt":
        mode    => 755,
        ensure  => present,
        content => "Nobody read the contents of this file.",
        }

}
