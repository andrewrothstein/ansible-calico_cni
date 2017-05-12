andrewrothstein.calico-cni
=========
[![Build Status](https://travis-ci.org/andrewrothstein/ansible-calico-cni.svg?branch=master)](https://travis-ci.org/andrewrothstein/ansible-calico-cni)

Installs the [Calico CNI plugin](https://github.com/projectcalico/cni-plugin)

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - username.calico-cni
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
