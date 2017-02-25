# Provisioning and deploying pepyatka-server
All scripts are tested with Debian 8. They probably won't work out of the box with other linux flavors.

## Installing ansible

    apt-get install python-dev gcc
    apt-get install python-pip
    pip install ansible

Minimal required ansible version is 1.9.
More installation options: http://docs.ansible.com/intro_installation.html#installing-the-control-machine

### Configuring

## Provisioning pepyatka
Copy dev.template to dev, replace placeholders with your data and run:

    ansible-playbook -i dev playbooks/essentials.yml [-u remote_user] [--ask-pass] [--ask-become-pass]
    ansible-playbook -i dev playbooks/site.yml [-u remote_user] [--ask-pass] [--ask-become-pass]

### Provisioning locally
Install ansible, clone this repo, replace placeholders in inventory 'local' with your data and run as root:

    ansible-playbook -i local playbooks/site.yml --connection=local

## Ad-hoc commands
Check if all servers are up:

    ansible -i dev all -m ping

Check status of nginx:

    ansible -i dev nginx -a "service nginx status"

## Development environment with vagrant
It's very easy to get a live-like VM with the help of vagrant and ansible.
Installing vagrant: https://www.vagrantup.com/downloads.html

Update Vagrantfile to point to your repositories, specify your feature branches and

    vagrant up

When you pushed some changes:

    ANSIBLE_ARGS='-tpepyatka' vagrant provision

To run full provisioning again:

    vagrant provision
