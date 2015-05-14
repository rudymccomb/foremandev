#puppet-vmwaretools

[![Build Status](https://secure.travis-ci.org/craigwatson/puppet-vmwaretools.png?branch=master)](http://travis-ci.org/craigwatson/puppet-vmwaretools)

####Table of Contents

1. [Overview - What is the puppet-vmwaretools module?](#overview)
2. [Module Description - What does the module do?](#module-description)
3. [Setup - The basics of getting started with puppet-vmwaretools](#setup)
    * [What puppet-vmwaretools affects](#what-puppet-vmwaretools-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with puppet-vmwaretools](#beginning-with-registry)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

##Overview

This module manages the installation and upgrade of VMware Tools via the source code tarballs distributed by VMware.

##Module Description

This module is designed to replace both the OSP packages provided by VMware's repositories and also the `open-vm-tools` package. The module is O/S independent (tested on Ubuntu and Red Hat systems).

The tarballs are transferred to the target by either HTTP download or Puppet filebucket (the default mechanism), and then uncompressed and installed via the archive's Perl installation script.

Upgrading of currently installed VMware Tools packages is also supported - the module obtains the currently-installed VMware Tools version via a custom fact, and only deploys the tarball if a version mismatch occurs or if VMware Tools is not installed on the target system.

##Setup

###What puppet-vmwaretools affects

* Compares installed version with the configured version via the `vmwaretools` fact
* Transfer the VMware Tools archive to the target agent (via Puppet or HTTP)
* Untar the archive and run vmware-install-tools.pl (warning: this installer is run with the `-d` flag to accept all default answers).
* Removes the `open-vm-tools` package.

###Setup Requirements

* Perl must be installed on the target systems in order to run the VMware Tools installer.
* Pluginsync must be enabled, due to the vmwaretools custom fact distributed with this module.
	
###Beginning with puppet-vmwaretools	

To accept default class parameters:

    include vmwaretools

##Usage

The source distribution mechanism can be customised by declaring the module with `archive_url` and `archive_md5` parameters (default is to use Puppet filebuckets).

To specify a non-default version, working directory and HTTP URL (other variables can be viewed and/or modified in `manifests/init.pp`):

    class { 'vmwaretools':
      version     => '8.6.5-621624',
      working_dir => '/tmp/vmwaretools'
      archive_url => 'http://server.local/my/dir',
      archive_md5 => '9df56c317ecf466f954d91f6c5ce8a6f',
    }

##Reference

###Facts
* `vmwaretools_version` - Detects any existing VMware Tools installations and, if found, reports the installed version.
* `esx_version` - Detects the underlying ESX version from `dmidecode`, thanks to [François Deppierraz](https://github.com/ctrlaltdel) for the [pull request](https://github.com/craigwatson/puppet-vmwaretools/pull/20)!

###Classes
* `vmwaretools::install::exec` - Declares all `exec` commands run by the module.
* `vmwaretools::install::archive` - Handles the archive distribution (either places a download script or the archive).
* `vmwaretools::params` - O/S-specific and module configuration (e.g. paths to binaries and a boolean variable to control file deployment)
* `vmwaretools::config_tools` - Executes `vmware-config-tools.pl -d` if the `vmci.ko` module doesn't exist for the running kernel
* `vmwaretools::timesync` - Handles time synchronisation between the virtual machine and host

##Limitations

###Supported Operating Systems

* Ubuntu - 12.04 LTS (Precise) and 10.04 LTS (Lucid) tested
* Red Hat family - RHEL 5 and 6 tested
* Debian family - written but untested, reports appreciated

###Unsupported Operating Systems

* Ubuntu 13.04 - see [VMware KB2050666](http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=2050666) and [bug #12](https://github.com/craigwatson/puppet-vmwaretools/issues/12)

##Development

* Copyright (C) 2013 Craig Watson - <craig@cwatson.org>
* VMware Tools fact by [janorn](https://github.com/janorn/puppet-vmwaretools)
* Distributed under the terms of the GNU General Public License v3 - see LICENSE file for details.
* Further contributions and testing reports are extremely welcome - please submit a pull request or issue on [GitHub](https://github.com/craigwatson/puppet-vmwaretools)
