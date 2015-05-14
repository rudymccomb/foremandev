#  this class installs postfix on any server
class hardened::postfix {
    package { [ 'postfix', 'mailx' ]:
        ensure => purged,
    }
}
