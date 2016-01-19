# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "debian/jessie64"
  config.vm.define 'visor' do |node|
    config.vm.hostname = "visor.foto23.com"
    config.vm.network "private_network", ip: "192.168.33.10"
    config.vm.provision :ansible do |ansible|
      ansible.playbook = "site.yml"
      ansible.raw_arguments = [
      "--vault-password-file=./password.txt",
      "-b",
      "--become-user=root"
      ]
    end
 end
end
