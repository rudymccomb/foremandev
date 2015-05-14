class accountstest::jim {



  users{ 'jim': 
    state => 'present', 
    id => 'jim', 
    uid => '10001', 
    gid => '10001', 
    pass => '$1$qj3Ks0$pNT55P98zsdJE5GeRUdHh0', 
    realname => 'Jim B', 
    #sgroups => ['audio']}


}
