# teknikbox
This is my repo for Monash cybersecurity projects

This repo contains three parts 
    1. Ansible ( Azure ELK automated deployment)
    2. Bash scripts 
    3. Network topology diagram



Ansible: 
Objective: To host DVWA application on Microsoft Azure and monitor / maintain SYSLOG of the server for security purposes. 

Requirements: 
    1. Webservers cannot be exposed to public 
    2. Access to webservers via loadbalancer
    3. A jumpbox to manage the infra ( with strict network access policy to allow only SSH)


Architecture: 
    1. A VM that is used to manage and maintain the infra for deployments using ansible playbooks
    2. A Load balancer to manage the incoming traffic and evenly distribute the load between the webservers.
    3. Host the webservers in a VPC
    4. Tighten the security by setting NSG rules using Azure NSG
    5. Deploy ELK stack using ansible playbook ( YAML configurations)


DEscription of terms : 
1. Ansible : Ansible is aan open source infrastructure provisioning & deployment tool used as IaaC ( infrastructure as a Code): Ansible uses a simple language called YAML script in the form Ansible playbooks that allow to describe automation scripts or jobs in a simple understandable language. 
To enable Ansible Playbook deployments, all the nodes( webservers) needs to be connected via ansible modules which can be accomplished by SSH to the VM`s 
Please refer to Ansible site for furhter information.
Process for ansible to use 
    1. connect to hosts or nodes via SSH ( after generating public key from Ansible machine and cat the pub file to VM`s)
    2. edit the ansible config file to include all webservers 
    3. ping test all the webservers ( ansible all -m ping )
    4. create your playbook for deployment 

2. VM : Virtual Machines are the server instances on azure that can be used to deploy webservers like httpd( apache), nginx etc to run our API`s or applications. VM`s are nothing but servers instances that are available via cloud providers like Azure that can be easily operated 

3. ELK stack : Elastic beanstack 
    Elastic stack is one of the opensource solution that helps monitor server via the syslog of the server. 
    Any VM has a SYSLOG service that spits out logging of whatever happens on the server. Elastic uses this SYSLOG ( /var/log/syslog) to audit the wedbser by visualising the syslog via kibana. 
    ELK has 3 steps to it 
        1. Elasticsearch  - Extract the logs and index
        2. Logstash       - store the logs after index
        3. Kibana         - Visual representation
    ELK has several metrics termed as beats that can be used for monitoring the VM
        Filebeat - primarily used to connect SYSLOG and forward the logs to desired location via elasticsearch or logstash
        metricbeat - create CPU metrics for monitoring and alert purposes. 

4. DVWA : Web application used for the project

Configuration details: 

Name	Type	IP Address	Operating System
Jump-Box-Provisioner	Gateway	10.0.0.4	Linux (Ubuntu 18.04)
Web-1	Web server	10.0.0.7	Linux (Ubuntu 18.04)
Web-2	Web server	10.0.0.8	Linux (Ubuntu 18.04)
Web-3	Web server	10.0.0.9	Linux (Ubuntu 18.04)
ELK-Server	ELK stack	10.1.0.4	Linux (Ubuntu 18.04)

Access Policy : 
As per the requirement the VM`s or the webservers are not exposed to public . This can be achieved by leveraging on the Azure Network security groups. 

the idea is to let only jumpbox access the webservers via SSH and only jumpbox is accessible to internet & access restricted to my ip address ( x.x.x.12)
1. set up access to ELK service on port 5601 for my home ip address
2. jumpbox access to the ELK servedr via port 22 

Access Policies view 

Name	                Public Access	Allow-IP Addresses
Jump-Box-Provisioner	    Yes (SSH)	xxx.xxx.xxx.249
Web-1	                    No	        10.0.0.4
Web-2	                    No	        10.0.0.4
Web-3	                    No	        10.0.0.4
ELK-Server	                Yes (HTTP)	xxx.xxx.xxx.249




