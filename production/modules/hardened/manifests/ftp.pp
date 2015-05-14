# Module: ftp
#
# Description:
# The ftp module ensures that gssftp and vsftp does not get installed on the
# server
#
# Linux Guide:
# 3.5.2
# 3.5.2.1, 3.5.2.3, 3.5.2.4, 3.5.2.5, 3.5.2.6, 3.5.2.7, 3.5.2.8
#
# CCE Reference:
# CCE-3660-8, CCE-3845-5, CCE-4325-7, CCE-4370-3, CCE-4387-7,
# CCE-4431-3, CCE-4475-0
#
# TODO:
# Some setting in /manifests/settings.pp could determine whether to use
# sshd at all.  And if so select one set of rules disabling sshd, and
# if not, select the other set of rules currently enforced.
#
# Tightening down iptables rules would also be recommended.
# Guide 3.5.2.9
#
class hardened::ftp {

  package { 'gssftp':
    ensure => absent,
  }

    service { 'gssftp':
      ensure => 'stopped',
      enable => false,
      #subscribe => File["/etc/ssh/sshd_config"],
      #require => Package["openssh-server"],
    }

  package { 'vsftp':
    ensure => absent,
  }

  package { 'ftp':
    ensure => absent,
  }
}
