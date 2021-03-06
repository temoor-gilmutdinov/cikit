---
title: Vagrant Box
excerpt: Information, access details and creation process.
permalink: /documentation/project/vagrant-box/
---

The Vagrant box is a VirtualBox image with clean OS, preinstalled inside. It is a playground for our future modifications during provisioning.

## Creation process

- Create virtual machine, named `CIKit Ubuntu 16.04 LTS`, disabled audio and USB.
- Install Ubuntu, downloaded from [https://www.ubuntu.com/download/server](https://www.ubuntu.com/download/server).
- Set password for `root` and `vagrant` users to `vagrant`.
- Permit `vagrant` user to run `sudo` without password (`/etc/sudoers.d/vagrant`).
- Add [official public key of Vagrant](https://github.com/mitchellh/vagrant/tree/master/keys) to `/home/vagrant/.ssh/authorized_keys`.
- Install OpenSSH.
- Install VirtualBox Guest Additions.

Nice, detailed instruction available at [https://blog.engineyard.com/2014/building-a-vagrant-box](https://blog.engineyard.com/2014/building-a-vagrant-box)

![Starting message](images/cikit-vagrant-box-motd.png)
