#!/bin/bash

mkdir /home/$(whoami)/Network-automation-tasks
cp -r ansible /home/$(whoami)/Network-automation-tasks
cd /home/$(whoami)/Network-automation-tasks

wget -O - https://github.com/athonet-open/pyrestserver/archive/master.tar.gz | tar xz
wget -O - https://github.com/jcraffael/pyrestclient/archive/master.tar.gz | tar xz
wget -O - https://github.com/jcraffael/Network-automation-tasks/archive/master.tar.gz | tar xz

cd Network-automation-tasks-master/ansible

ansible-playbook -i ./hosts ios_configure.yml -u admin &

pid=$(ps aux | grep ansible-playbook | grep -v "grep" | awk '{print $2}')
while ps -p $pid > /dev/null; do sleep 1s; done;

ansible-playbook -i ./hosts webserver_configure.yml -u ubuntu &
ansible-playbook -i ./hosts client_configure.yml -u ubuntu &






