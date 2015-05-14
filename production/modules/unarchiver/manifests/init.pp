# == Class: unarchiver
#
# Installs The Unarchiver for OS X.
#
# === Parameters:
#
# [*version*] Version of The Unarchiver to install
#
# === Examples
#
#  class { 'unarchiver':
#    version => '3.8',
#  }
#
# === Authors
#
# Ryan Skoblenick <ryan@skoblenick.com>
#
# === Copyright
#
# Copyright 2013 Ryan Skoblenick.
#
class unarchiver (
  $version = $unarchiver::params::version
) inherits unarchiver::params {
  anchor {'unarchiver::begin': } ->
  class {'unarchiver::install': } ->
  anchor {'unarchiver::end': }
}