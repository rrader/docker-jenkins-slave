# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "frensjan/centos-7-64-lxc"
  config.vm.provider "lxc"

  config.vm.provision "shell", path: "setup.sh"

  config.vm.synced_folder "data/jenkins", "/var/lib/jenkins/"

  config.vm.provider :lxc do |lxc|
    lxc.customize 'aa_profile', 'unconfined'

#    lxc.customize 'lxc.mount.auto' 'proc:mixed sys:rw'

    lxc.customize 'cgroup.devices.allow', 'c 4:* rwm'
    lxc.customize 'cgroup.devices.allow', 'c 5:1 rwm'
    lxc.customize 'cgroup.devices.allow', 'c 10:* rwm'
  end
end
