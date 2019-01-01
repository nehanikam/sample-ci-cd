#!/bin/bash

yum update -y 

# install jenkins 

sudo yum install java-1.8.0-openjdk -y
sudo yum install -y wget
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum install jenkins -y
sudo service jenkins start
sudo chkconfig jenkins on

# install ansible
sudo rpm -ivh http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
sudo yum update -y
sudo yum install ansible -y
