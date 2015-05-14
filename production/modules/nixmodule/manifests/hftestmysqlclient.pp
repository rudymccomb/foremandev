class nixmodule::FOOestmysqlclient {

include repo_mysql

package { 'mysql-community-client':
    ensure => 'latest',
}

}
