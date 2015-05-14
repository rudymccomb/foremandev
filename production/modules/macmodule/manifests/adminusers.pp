class macmodule::adminusers {
          # Create local user
       
        # Creates a variable for the password based on the OS Version
        # All the password hashes represent the same password - for 10.8 and 10.9
        $password = $macosx_productversion_major ? {
         '10.8' => '7b57a817fc9bca4c1bef2c5c8b8b3870a07adb6129757e374951bb70b51405e4aabffdd7ed1a5e9a3ef341b2fb53ca65db5708dae3202bfe83b67cfd34920eba3c1dbecf712b2b9d06ceb7e91b7324fab1cd2105fb0139af5e637ee1b6d6786881081efbbe388713c454656700afe5459efb14e4d9147f3219a42b6f5b48d88b',
	'10.9' => 'c5846f979efe3f4d34281d126b2ae66784dd2965e359d7b4338c5fc0e76093eeac88d8d24e17ca4d40f92b32fa2da034ab7f96d6c6d39a8c7a1d249e19e18132651eb87ca0a4a9925292f9a10aaede90f278fe527191466e56deec6f802fad084b8d5c494d0cb890fb5638bfe5ebfb383819ec59a859fc135e3e37193b5ccbbb',         
        } 

        #create home folder directory
        file { '/Users/madmin':
                ensure                   => 'directory',
        }
        
        #create user permissions
          user { 'madmin': 
                ensure                 => 'present', 
                comment         => 'Mac Administrator', 
                gid                 => '20', 
                groups                 => ['_appserveradm', '_appserverusr', '_lpadmin', 'admin'],                         
                home                 => '/Users/madmin',

                salt            => $macosx_productversion_major ? {
                            '10.8'  => 'cf76ea80e22d0f952a48303fb7067408cb8ffed79e6587c55cf48d25e8a0f26a',
                            '10.9'  => '540e6decf5db43f6755bf3a822bf81795e37f7292bdefc01cf987804d7a290f4',
                  },

 
                iterations         => $macosx_productversion_major ? {
                            '10.8'  => '38610',
                            '10.9'  => '40160',
                  },
 
                password         => $password, 
                shell                 => '/bin/bash', 
                uid                 => '501',
                #managehome         => true, 
        }
                  

         #adds wallpaper for admin user
         # Puts /etc/puppet/modules/testmodule/SampleConfig.conf on the client.
        # On the client, it's going into /etc/SampleConfig.conf
        #file { "/Users/luser/Pictures/macbackground.jpg":
                #ensure => present,
                #source => "puppet:///modules/testmodule/macbackground.jpg",
                #}
}
