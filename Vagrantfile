# -*- mode: ruby -*-
# vi: set ft=ruby :
file_to_disk = './tmp/large_disk.vdi'

Vagrant.configure(2) do |config|
  #config.vm.box = "http://www.tvollmer.de/xenial_with_LVM_extra_space.box"
  #config.vm.box = "~/xenial_with_LVM_extra_space.box"
  config.vm.box = "gbarbieru/xenial"

  # Configuration deployment
  config.vm.provision "preinstall", type: "shell", inline: "sudo apt-get -y install facter python"
  config.vm.provision "ansible" do |ansible|
    ansible.groups = {
      "hypervisor" => ["visor"],
      "monitoring" => ["monitor"],
      "guest" => ["srv"],
      "mailserver" => ["srv"],
      "router" => ["rt2"]
      
    }
    ansible.playbook = "all.yml"
    ansible.raw_arguments = [
      "--vault-password-file=./password.txt",
      "-b",
      "--become-user=root"
    ]
  end
  config.vm.define 'visor' do |visor|
    visor.vm.hostname = "visor.foto23.com"
    visor.vm.network "private_network", ip: "192.168.33.10"
  end
  config.vm.define 'srv' do |srv|
    srv.vm.hostname = "srv.foto23.com"
    srv.vm.network "private_network", ip: "192.168.33.11"
  end
  config.vm.define 'rt2' do |rt2|
    rt2.vm.hostname = "rt2.buero.tvollmer.de"
    rt2.vm.network "private_network", ip: "192.168.33.12"
    rt2.vm.provider "virtualbox" do |vb|
      unless File.exist?(file_to_disk)
        vb.customize ['createhd', '--filename', file_to_disk, '--variant', 'Fixed', '--size', 20 * 1024]
      end
      vb.customize ['storageattach', :id,  '--storagectl', 'SATA', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', file_to_disk]
    end
    rt2.vm.provision "preinstall", 
      type: "shell", 
      preserve_order: true, 
      inline: "sudo apt-get -y install facter python lvm2; pvdisplay /dev/sdb || ( pvcreate /dev/sdb; vgcreate default /dev/sdb )"
  end
end
