# hardened

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with rhelhardened](#setup)
    * [What rhelhardened affects](#what-rhelhardened-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with rhelhardened](#beginning-with-rhelhardened)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

this is a base hardening module for puppet based on NIST hardening module.
currently it manages the following

#resources
#include 'hardened::auditd::auditd'
include hardened::aide
include hardened::auditd
include hardened::avahi
include hardened::badperms
include hardened::banner
include hardened::bootup
include hardened::consoleperms
#include "coredmp"
include hardened::cronat
include hardened::execshield
include hardened::fstab
include hardened::ftp
#include homeperms #this jacks up vagrant box, leave disabled for now
#include iptables
include hardened::ipv6
include hardened::kernel #this may not work for now
include hardened::logrotate
#include logwatch #this does not need to be enabled
include hardened::modprobe
include my_fw #replaces iptables module
include hardened::nfs
#include hardened::ntp #not working but can be managed with foreman ntp module
#include hardened::nexpose # requires my_fw rules from foreman
#include ldap # for AD binding
include hardened::pam
#include password #save deployment for RS
#include path
#include postfix
#include puppet
include hardened::rpmverify
#include samba
#include screenlock
#include selinux
include hardened::sendmail
include hardened::services
include hardened::sysstat
include hardened::ssh #my_fw rule is located in this manifest
#include sudo #save deployment for RS. this will screw up vagrant user when deployed as is
include hardened::rsyslog
include hardened::umask
#include wireless
#include yum

## Module Description

If applicable, this section should have a brief description of the technology
the module integrates with and what that integration enables. This section
should answer the questions: "What does this module *do*?" and "Why would I use
it?"

If your module has a range of functionality (installation, configuration,
management, etc.) this is the time to mention it.

## Setup

### What rhelhardened affects

* A list of files, packages, services, or operations that the module will alter,
  impact, or execute on the system it's installed on.
* This is a great place to stick any warnings.
* Can be in list or paragraph form.

### Setup Requirements **OPTIONAL**

If your module requires anything extra before setting up (pluginsync enabled,
etc.), mention it here.

### Beginning with rhelhardened

The very basic steps needed for a user to get the module up and running.

If your most recent release breaks compatibility or requires particular steps
for upgrading, you may wish to include an additional section here: Upgrading
(For an example, see http://forge.puppetlabs.com/puppetlabs/firewall).

## Usage

Put the classes, types, and resources for customizing, configuring, and doing
the fancy stuff with your module here.

## Reference

Here, list the classes, types, providers, facts, etc contained in your module.
This section should include all of the under-the-hood workings of your module so
people know what the module is touching on their system but don't need to mess
with things. (We are working on automating this section!)

## Limitations

This is where you list OS compatibility, version compatibility, etc.

## Development

Since your module is awesome, other users will want to play with it. Let them
know what the ground rules for contributing are.

## Required Modules

https://forge.puppetlabs.com/saz/ssh


## Rackspace Environment Inventory

web1-6(magento app servers) = 6
db1-5(rhel pacemaker cluster) = 5
redis1-2 = 2
geopip

## Release Notes/Contributors/Etc **Optional**

If you aren't using changelog, put your release notes here (though you should
consider using changelog). You may also add any additional sections you feel are
necessary or important to include here. Please use the `## ` header.
