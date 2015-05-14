# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "mavericks64"
  config.vm.box_version = "0"
  config.vm.box_check_update = true

  config.vm.provider "vmware_fusion" do |v, override|
    v.gui = false
    override.vm.box_url = "http://localhost/boxes/mavericks64_vmware.box"
  end

  config.vm.provision "shell" do |s|
    s.path = "https://raw.github.com/skoblenick/scripts/master/install_puppet.sh"
  end

  config.vm.provision "shell" do |s|
    s.args = "puppetlabs/stdlib"
    s.path = "https://raw.github.com/skoblenick/scripts/master/install_puppet_module.sh"
  end

  config.vm.provision "shell" do |s|
    s.inline = "sudo puppet resource file '/etc/puppet/modules/unarchiver' ensure=link target='/vagrant'"
  end

  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "tests"
    puppet.manifest_file = "init.pp"
    puppet.options = "--verbose --debug"
  end

end
