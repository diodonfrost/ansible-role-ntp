# ansible-role-ntp

[![Build Status](https://travis-ci.org/diodonfrost/ansible-role-ntp.svg?branch=master)](https://travis-ci.org/diodonfrost/ansible-role-ntp)
[![Ansible Galaxy](https://img.shields.io/badge/galaxy-diodonfrost.ntp-660198.svg)](https://galaxy.ansible.com/diodonfrost/ntp)

his role provide a compliance for install ntp on your target host.

## Requirements

This role was developed using Ansible 2.4 Backwards compatibility is not guaranteed.
Use `ansible-galaxy install diodonfrost.ntp` to install the role on your system.

Supported platforms:

```yaml
- name: EL
  versions:
    - 7
    - 6
    - 5
- name: Fedora
  versions:
    - 29
    - 28
    - 27
    - 26
- name: Debian
  versions:
    - stretch
    - jessie
    - wheezy
    - squeeze
- name: Ubuntu
  versions:
    - bionic
    - xenial
    - trusty
    - precise
    - trusty
- name: OracleLinux
  versions:
    - 7
    - 6
- name: Amazon
  versions:
    - 2017.12
    - 2016.03
    - 2013.09
- name: opensuse
  versions:
    - 13.2
    - 42.1
    - 42.2
    - 42.3
- name: SLES
  versions:
    - 11
    - 12
    - 15
- name: ArchLinux
  versions:
    - any
- name: Gentoo
  versions:
    - stage3
- name: FreeBSD
  versions:
    - 11.2
    - 10.4
    - 10.3
```

## Role Variables

This role has multiple variables. The defaults for all these variables are the following:

```yaml
---
# defaults file for ansible-role-ntp

```

## Dependencies

None

## Example Playbook

This is a sample playbook file for deploying the Ansible Galaxy ntp role in a localhost.

```yaml
---
- hosts: localhost
  become: true
  roles:
    - role: diodonfrost.ntp
```

## Local Testing

The preferred way of locally testing the role is to use Docker. You will have to install Docker on your system.

You can also use vagrant and Virtualbox with vagrant to run tests locally. You will have to install Virtualbox and Vagrant on your system. For all our tests we use test-kitchen.

Next install test-kitchen:

```shell
# Install dependencies
gem install bundler
bundle install
```

### Testing with Docker

```shell
# List all tests with kitchen
kitchen list

# fast test on one machine
kitchen test default-centos-7

# test on all machines
kitchen test

# for development, create environment
kitchen create default-centos-7

# Apply ansible playbook
kitchen converge default-centos-7

# Apply inspec tests
kitchen verify default-centos-7
```

### Testing with Virtualbox

```shell
# Specify kitchen file on Linux
export KITCHEN_YAML=.kitchen-vagrant.yml

# fast test on one machine
kitchen test os-packaging-freebsd-112
```
### Testing Windows and Solaris with Virtualbox

Windows and Solaris can only be test with Virtualbox provider,do not use 'kitchen test' command for testing Windows and Solaris environment. There 4 steps you will be using with test-kitchen as part of your workflow.

First of all we must set the kitchen file:
```shell
# For testing Windows
export KITCHEN_YAML=.kitchen-windows.yml

# For testing Solaris
export KITCHEN_YAML=.kitchen-solaris.yml
```

Provision the virtual machines, a Linux machine to run Ansible and Windows/Solaris machines to apply playbook again:
```shell
# deploy machines
kitchen create

# Launch playbook
kitchen converge
```

Finaly launch inspec tests:
```shell
kitchen verify
```

For cleaning environment use:
```shell
kitchen destroy
```

## License

Apache 2

## Resources

[ntp on ubuntu](https://doc.ubuntu-fr.org/ntp)

## Author Information

This role was created in 2018 by diodonfrost.
