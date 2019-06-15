This is an ansible playbook to deploy OpenStack Stein for Ubuntu
following [OpenStack Installation Guide](https://docs.openstack.org/install-guide/)
as much as possible.

This is under development.
The Identity, Image, Compute, Networking are tested with Ansible 2.8.0

# Getting started

## Prerequisites

### Install Ansible

 ```bash
 $ sudo apt install python3-venv
 $ python3 -m venv python
 $ source python/bin/activate
 $ pip install ansible
 ```

### Clone and configure

Clone the playbook.

 ```bash
 $ git clone https://github.com/hidekazuna/os-install.git
 $ cd os-install/playbooks
 ```

Configure files for your environments.
The directory layout follows [Best Practices](https://docs.ansible.com/ansible/latest/user_guide/playbooks_best_practices.html#directory-layout).

## Run the playbook

Run the playbook.
I recommend to run with check and diff option first.
   
  ```bash
  $ ansible-playbook -i all computes.yml -k -K -b -DC
  SSH password: 
  BECOME password[defaults to SSH password]:
  ```
If it's OK, run.

  ```bash
  $ ansible-playbook -i all computes.yml -k -K -b
  SSH password: 
  BECOME password[defaults to SSH password]:
  ```

# limitations

- Implement only Networking Option 2: Self-service networks
- This playbook is not idempotent which means you have to remove database
  records or databases itself before you run again. 

# License

Apache License, Version 2.0
