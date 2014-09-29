VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "centos65-puppet"
  config.vm.hostname = "foreman.localdomain"
  config.vm.network "private_network", ip: "192.168.33.22"
  config.vm.synced_folder "./", "/etc/puppet/environments/", :enabled => "true"
  config.vm.synced_folder "./", "/vagrant/", :enabled => "true"
   config.vm.provider :virtualbox do |vb|
    # Don't boot with headless mode
    vb.gui = false
    vb.name = "foreman1.5"
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end
  config.vm.provision :shell, :path => 'bootstrap.sh', :args => ENV['repo'] || "releases/latest"
end
