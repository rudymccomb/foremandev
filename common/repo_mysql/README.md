# About
Installs the [MySQL community server Yum repository](http://dev.mysql.com/downloads/repo/)
on Redhat-based (RHEL, CentOS, Fedora) operating systems.

# Usage

```puppet
include repo_mysql
```

To install the MySQL server and client from this repo, use the package names `mysql-community-server`
and `mysql-community-client`, respectively. For example:

```puppet
package { 'mysql-community-server':
    ensure => 'latest',
}
```

# License
Apache Software License 2.0

