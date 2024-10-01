#!/bin/sh -xv

yum update -y
yum install maven jq ansible make -y
yum install awscli -y

#Script to add a user to Linux system
username='ansible'
password='ansible123'
if [ $(id -u) -eq 0 ]; then
    egrep "^$username" /etc/passwd >/dev/null
    pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
    useradd -m -p $pass $username
    [ $? -eq 0 ] && echo "User has been added to system!" || echo "Failed to add a user!"
    # ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa <<<y >/dev/null 2>&1
    # Run me with superuser privileges
    echo "$username       ALL=(ALL)      NOPASSWD: ALL" >> /etc/sudoers
    # Enable password login
    sed -ri 's/#?PasswordAuthentication\s.*$/PasswordAuthentication yes/' /etc/ssh/sshd_config
    #sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config
    service sshd restart
else
    echo "Only root may add a user to the system"
    exit 2
fi