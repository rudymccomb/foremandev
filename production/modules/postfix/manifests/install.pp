#  this class installs postfix on any server
class postfix::install {
    package { [ 'postfix', 'mailx' ]:
        ensure => present,
    }
}
