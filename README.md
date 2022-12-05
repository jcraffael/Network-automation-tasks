# Network-automation-tasks

This project serves the purpose of configure a small network with ansible.
The network topology is shown in the following:
![image](https://user-images.githubusercontent.com/64780211/205602757-66a6c02a-54d2-46f9-90d4-1acc1081f29b.png)

Prerequests:
- Ansible control machine(ubuntu based docker container): 2 network adapters at disposal; The one connected to NAT cloud is configured with dhcp, and the other one connected to the router shall be configured with static ip 10.1.3.2/24, with route to other subnets (10.1.1.0/24 and 10.1.2.0/24) configured.
- webserver (ubuntu based cloud server): 2 network adapters at disposal; The one connected to NAT cloud is configured with dhcp, and the other one connected to the router shall be configured with static ip 10.1.1.2/24, with route to other subnets (10.1.3.0/24 and 10.1.2.0/24) configured. SSH service running (SSH username: ubuntu, password: ubuntu).
- client (ubuntu based cloud server): 2 network adapters at disposal; The one connected to NAT cloud is configured with dhcp, and the other one connected to the router shall be configured with static ip 10.1.2.2/24, with route to other subnets (10.1.3.0/24 and 10.1.1.0/24) configured. SSH service running (SSH username: ubuntu, password: ubuntu).
- Cisco router (CiscoIOSv15.7 based): 3 network adapters at disposal; All 3 are configured with static ip. The first one connected to Ansible control machine shall be configured to 10.1.3.1/24 manually. The second one connected to webserver shall be configured to 10.1.1.1/24 and the third one connected to client shall be configured to 10.1.2.1/24, both of which can be provisioned via Ansible playbook "ios_configure.yml". SSh service configured and enabled manually (username: admin, password: ciscorouter). Enable mode password set (ciscorouter)

# How to use
Run the run.sh script with ```sh run.sh```

# What to expect
The script will:
1. Create project folder as /home/$(whoami)/Network-automation-tasks and place the necessary files;
2. Download pyrestserver project from Github, transfer it to webserver and install the package.
3. Download pyrestclient project from Github, transfer it to client and install the package.
Then between client and server it's possible to test the RESTapi.

