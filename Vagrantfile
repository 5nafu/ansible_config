# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "debian/jessie64"

  # Configuration deployment
  config.vm.provision "shell", inline: "sudo apt-get -y install facter python"
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
  end
end
