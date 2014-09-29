#!/bin/bash

service iptables stop
chkconfig iptables off

_PKG=$(rpm -qa '(redhat|sl|centos|oraclelinux)-release(|-server|-workstation|-client|-computenode)')
distver=$(rpm -q --queryformat '%{VERSION}' $_PKG | grep -o '^[0-9]*')
if [ $distver = 6 ]; then
    rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
elif [ $distver = 7 ]; then
    rpm -ivh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-2.noarch.rpm
fi
rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-${distver}.noarch.rpm

yum-config-manager --enable epel-testing puppetlabs-devel

# if your box has puppet etc already on it, you may want this
#rpm -e puppet
#yum -y upgrade puppet\* facter\* ruby\*

yum -y install http://yum.theforeman.org/$1/el${distver}/x86_64/foreman-release.rpm
yum -y install foreman-installer
foreman-installer
