class nixmodule::FOOestmysqlserver {

include repo_mysql

package { 'mysql-community-server':
    ensure => 'latest',
}

}
