#!/bin/bash
#This is what I did on a (virtual) computer with Ubuntu Desktop 14.04 LTS
# Might be different for Ubuntu Server
# This is a developemnt server not production ready
echo "The Meucci Library software setup"
echo "by Stefano Carlesso"
echo -e "\E[31;47m\
Do you want to install LAMP? (Y or N)\
\E[0m"
read user_answer
if [[ $user_answer == 'Y' || $user_answer == 'y' ]]
then
    echo "starting installation"
else
    echo "bye!"
    exit 0
fi
# INSTALL NEDDED PACKAGES
# I use --yes to prevent user
sudo apt-get --yes update
# https://help.ubuntu.com/community/ApacheMySQLPHP
sudo apt-get --yes install apache2
sudo apt-get --yes install php5
# an alternative is to install "php-cgi" instead of "libapache2-mod-php5"
sudo apt-get --yes install mysql-server
sudo apt-get --yes install php5-mysql
sudo apt-get --yes install libapache2-mod-auth-mysql # missing from official server guide

## CONFIGURATION
echo "ServerName localhost" | sudo tee /etc/apache2/conf-available/fqdn.conf
# Fully qualified domain name
sudo a2enconf fqdn
sudo a2enmod php5
# to use $HOME/public_html : access from http://localhost/~$USER
sudo a2enmod userdir
# Use the Development config file for PHP instead of the production one
sudo cp /usr/share/php5/php.ini-development /etc/php5/apache2/php.ini
sudo service apache2 restart
echo -e "\E[31;47m\
Do you want to create \"public_html\" directory within $HOME (Y or N) ?
\E[0m"
read user_answer
if [[ $user_answer == 'Y' || $user_answer == 'y' ]]
then
    mkdir $HOME/public_html
    sudo --user=$USER chmod -R 755 $HOME/public_html
else
    echo "ok"
fi
