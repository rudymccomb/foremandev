#
# Class: rsyslog
#
# Description:
# This class configures rsyslog from files included in the templates
# directory and ensures appropriate log files are present.
#
# Guide Sections:
# 2.6.1
# 2.6.1.2
# 2.6.1.3
# 2.6.1.4
#
# CCE Reference:
# CCE-3382-9
# CCE-3679-8
# CCE-3701-0
# CCE-4233-3
# CCE-4260-6
# CCE-4366-1
#
# File:
# /etc/puppet/modules/syslog/manifests/init.pp
#
class hardened::rsyslog {

  include epel

  service { 'syslog':
    ensure => stopped,
    enable => false,
    before => Class['rsyslog::client']
  }

  service { 'syslog-ng':
    ensure => stopped,
    enable => false,
    before => Class['rsyslog::client']
  }

  service { 'sysklogd':
    ensure => stopped,
    enable => false,
    before => Class['rsyslog::client']
  }

  class{ 'rsyslog::client':
    log_remote     => true,
    log_local      => true,
    log_auth_local => true,
    require        => Class['epel'],
    remote_servers => [
      {
        host      => '10.100.24.204',
        port      => '5514',
        pattern   => '*.*',
        protocol  => 'tcp',
      },
      {
        host      => '10.100.21.75',
        port      => '514',
        pattern   => '*.*',
        protocol  => 'udp',
      },
    ]
  }

  file {

    # GuideSection 2.6.1.2
    # CCE-4233-3
    # CCE-4366-1
    # CCE-3701-0
    '/var/log/messages':
                        owner  => root,
                        group  => root,
                        mode   => 600,
      ensure => present;
    '/var/log/kern.log':
                        owner  => root,
                        group  => root,
                        mode   => 600,
                        ensure => present;
    '/var/log/daemon.log':
                        owner  => root,
                        group  => root,
                        mode   => 600,
                        ensure => present;
    '/var/log/syslog':
                        owner  => root,
                        group  => root,
                        mode   => 600,
      ensure => present;
    '/var/log/unused.log':
                        owner  => root,
                        group  => root,
                        mode   => 600,
                        ensure => present;
    '/var/log/secure':
      owner  => root,
      group  => root,
      mode   => 600,
      ensure => present;
    '/var/log/maillog':
      owner  => root,
      group  => root,
      mode   => 600,
      ensure => present;
    '/var/log/cron':
      owner  => root,
      group  => root,
      mode   => 600,
      ensure => present;
  }

}
