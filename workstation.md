# Install on Workstation:

Before you install / checkout the repository, you might want to install the following applications:

```bash
sudo apt install scdaemon pcscd pcsc-tools git
```

Additionally you should enable the gpg agent and disable the ssh-Agent:

```bash
mkdir ~/.gnupg
echo "enable-ssh-support" >>~/.gnupg/gpg-agent.conf
sudo sed -i 's/^use-ssh-agent/#use-ssh-agent/' /etc/X11/Xsession.options
export GPG_AGENT_INFO=/home/tvollmer/.gnupg/S.gpg-agent
export SSH_AUTH_SOCK=/home/tvollmer/.gnupg/S.gpg-agent.ssh 

```

After that you can clone the Git repository and run the workstation.sh
```bash
mkdir ~/git; cd ~/git
git clone git@github.com:5nafu/ansible_config.git
cd ansible_config
./workstation.sh
```
