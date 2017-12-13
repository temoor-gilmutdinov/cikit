# Continuous Integration Kit

**CIKit** - the Ansible-based system for building different development environments. It ships as a package that you can extend.

- Need a VM for local development (JS, NodeJS, Java, PHP, Composer, Solr, Memcache, Selenium, Python, MySQL, MSSQL, Ruby etc.)? Not a problem - `cikit init --project=test && cd test && vagrant up`.
- Wanna replicate a local (VM) environment on continuous integration server? [Not a problem](docs/matrix).
- Need a park for CI servers? [Not a big deal](docs/matrix).

*Currently based on [Ubuntu 16.04 LTS (64 bit)](docs/vagrant/box)*.

## Features

- Hosts manager
  - [Define a connection to a server](docs/hosts-manager) via command line.
- Hosts matrices
  - [Produce a host for CI servers](docs/matrix#usage) by a single command.
  - [Manage CI servers (droplets)](docs/matrix#management) via single command.
- CI server
  - Docker. More system resources for your needs. (comparative to the hypervisor).
  - Jenkins with configured GitHub workflow.
- Virtual machine
  - Automatic IP allocation. You're no longer care about changing the IP for every new VM.
  - [Shippable environment configuration](docs/project/env-config). Once created - everywhere updated.

## Documentation & support

- Global project documentation [available here](docs#documentation).
- All communications are available in our Slack at https://cikit.slack.com

## Dependencies

|Name|Version|
|:---|:---|
|[Ansible](https://github.com/ansible/ansible)|2.4+|
|[Vagrant](https://github.com/hashicorp/vagrant)|1.9+|
|[VirtualBox](https://www.virtualbox.org)|5.1+|

Linux, macOS or Windows with [WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10).

## Quick start

- Install the **CIKit** (only once, package will be located at `/usr/local/share/cikit`).

  ```shell
  curl -LSs https://raw.githubusercontent.com/BR0kEN-/cikit/master/install.sh | bash
  ```

- Create CIKit-based project.

  ```shell
  cikit init --project=<NAME> [--cmf=drupal|wordpress] [--version=7.56|8.5.x-dev|4.9.1] [--without-sources]
  cd <NAME>
  ```

  The `--without-sources` option affects CMF downloading. Use it for creating a project with an empty `docroot`, where you can place whatever you want).

- Build a virtual machine for local development.

  ```shell
  vagrant up --provision
  ```

  Install a website inside of VM (will be accessible at `https://<PROJECT-NAME>.dev`).

  ```shell
  vagrant ssh
  cikit reinstall
  exit
  ```

- [Add your host](docs/hosts-manager) credentials (not needed to continue without remote CI server).

- Provision remote CI server.

  ```
  cikit provision --limit=<HOSTNAME>
  ```

Last two steps are not mandatory. You can omit them and just use CIKit locally.

## Provisioning variations

**Provision** - is an operation that configures CI server or virtual machine and installs necessary software there to convert it to a unit for development.

At the very first time you are required to run full provisioning to build the environment correctly. After that you may decide to reinstall or reset configuration of some part of it. This is feasible thanks to the separation of a provisioning.

Get the list of available components:

```shell
CIKIT_LIST_TAGS=true cikit provision
```

Run provisioning of a specific component (CI server):

```shell
CIKIT_TAGS="COMPONENT1,COMPONENT2" cikit provision
```

Run provisioning of a specific component (virtual machine):

```shell
CIKIT_TAGS="COMPONENT1,COMPONENT2" vagrant provision
```
