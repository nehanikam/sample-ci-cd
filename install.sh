#!/bin/bash

yum update -y 

# install git
sudo yum install git -y

# install jenkins 
sudo yum remove java -y
sudo yum install java-1.8.0-openjdk -y
sudo yum install -y wget
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum install jenkins -y
sudo service jenkins start
sudo chkconfig jenkins on

# install ansible
#sudo rpm -ivh http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm #centos6.8
# sudo yum update -y
# sudo yum install ansible -y

#install ansible az linux2
sudo yum-config-manager --enable epel #amaz-linux
yum install ansible -y


#clone the configuration to remote
cd /tmp
mkdir /ansible-config
git clone https://github.com/nehanikam/sample-ci-cd.git
cp -R ./config/*.* /ansible-config
