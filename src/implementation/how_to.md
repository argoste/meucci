#The Meucci Library software manual

written by Stefano Carlesso


## Installation

Feel free to use whatever platform you prefer. For the sake of simplicity I
choose Ubuntu. To develop I used Ubuntu 14.04 LTS and later Ubuntu 16.04 LTS.
I use the Xfce desktop.

TODO: add instructions for use with Apache and other platforms (MS Windows, OSX)


## Text editor

A complicated IDE like Eclipse is not used. Instead I will use different tools
for different jobs. Make esasier, for anybody contributing, to use the tools 
they are used to, for as much as it is possible.

I've used many different text editors, like Gedit, Geany  Komodo Edit. 


## Web browsers

Firefox and Chromium browsers.


## Graphics

GIMP and Inkscape for the graphics.


##  


## Version Control

I used Git. The project is hosted on GitHub. Comand line tools, along with 
git-gui.


### Server software
For 
easier development I think it is better to have a server running on your local 
machine. 

You can install it as a bundle, or use a normal server installation.


#### Server software Bundle

The bundle is easier to install. It is also easier to switch on off, so it 
won't affect too much your machine 
performance. In other words itr is best suited for development. 
My choice is (XAMPP)[https://www.apachefriends.org/index.html]. it exists for 
GNU/Linux, OS X, MS Windows. 


#### Manual install

For deployment you must use a normal server installation because it is more 
secure.

The server software is of course GNU/Linux Ubuntu 14.04 LTS,  Lighttpd, PHP5, 
MySQL.

Copied form
[lighttpd on ubuntu community help](https://help.ubuntu.com/community/lighttpd) . 

Install lighttpd

	sudo apt-get install lighttpd

Enable the user directories i.e. you can put your php code into the  `public_html`
directory contained in the user home.

	sudo lighttpd-enable-mod userdir
	sudo service lighttpd reload

Then download the meucci distribution, unzip it and move it
into `/home/$user/public_html/`. ( please replace $user with your username)

	wget 
	unzip meucci.zip
	mv meucci /home/$user/public_html/

Of course you can also put it in another appropriate location.

Then define this variable

	meucci_dir=/home/$user/public_html/meucci

Then you can simply refer in bash scripts with `$meucci_dir`, like

	echo $meucci_dir

Install and setup PHP

	sudo apt-get install php5-cgi
	sudo lighttpd-enable-mod fastcgi fastcgi-php
	sudo service lighttpd reload

Setup the password for the special user `root` of MySQL server with

	sudo dpkg-reconfigure mysqld



## How to use MySQL/MariaDB

Now we use the mysql command line tool interactively

The mysql command line tool understand SQL commands, like 
`SELECT * FROM secret_database;` Don't forget the semicolon at the end.

It also understand MySQL internal commands (without semicolon at the end). For
example `help`, `exit`, `use` (the latter to choose the database to work on).
	
Login as mysql root (you will be asked the password you set earlier)

	mysql --user=root --password

then create the database executing the script `data_definition.sql`

	source $meucci_dir/sql/data_definition.sql

create the user `librarian` because it is not safe to access «mysql root» from
PHP script.

	source $meucci_dir/sql/user_creation.sql

You can then exit from mysql command-line

	exit


## Credits

I used, among the others,  the following sources of information. Thanks a lot,
mates!

+ [Official Ubuntu Documentation](https://help.ubuntu.com/)
+ [Mozilla Developer Network](https://developer.mozilla.org/en-US/)
+ «Learning PHP, MySQL, JavaScript, CSS & HTML5», 3rd edition,  by Robin Nixon
+ 




