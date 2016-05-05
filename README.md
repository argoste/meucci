#The Pergamos Library software manual

written by Stefano Carlesso

Feel free to use whatever platform you prefer. For the sake of simplicity I
choose Ubuntu. To develop I used Ubuntu 14.04 with Xfce desktop (aka Xubuntu),
Geany (text editor), Komodo Edit (text editor), Firefox, GIMP, Inkscape. The
server software is of course GNU/Linux Ubuntu 14.04 LTS,  Lighttpd, PHP5, MySQL.

TODO: add instructions for use with Apache and other platforms (MS Windows, OSX)

## What I did

###Server setup

Copied form
[lighttpd on ubuntu community help](https://help.ubuntu.com/community/lighttpd) . 

Install lighttpd

	sudo apt-get install lighttpd

Enable the user directories i.e. you can put your php code into the  `public_html`
directory contained in the user home.

	sudo lighttpd-enable-mod userdir
	sudo service lighttpd reload

Then download the pergamos distribution, unzip it and move it
into `/home/$user/public_html/`. ( please replace $user with your username)

	wget 
	unzip pergamos.zip
	mv pergamos /home/$user/public_html/

Of course you can also put it in another appropriate location.

Then define this variable

	pergamos_dir=/home/$user/public_html/pergamos

Then you can simply refer in bash scripts with `$pergamos_dir`, like

	echo $pergamos_dir

Install and setup PHP

	sudo apt-get install php5-cgi
	sudo lighttpd-enable-mod fastcgi fastcgi-php
	sudo service lighttpd reload

Setup the password for the special user `root` of MySQL server with

	sudo dpkg-reconfigure mysqld



###Something more interesting

Now we use the mysql command line tool interactively

The mysql command line tool understand SQL commands, like 
`SELECT * FROM secret_database;` Don't forget the semicolon at the end.

It also understand MySQL internal commands (without semicolon at the end). For
example `help`, `exit`, `use` (the latter to choose the database to work on).
	
Login as mysql root (you will be asked the password you set earlier)

	mysql --user=root --password

then create the database executing the script `data_definition.sql`

	source $pergamos_dir/sql/data_definition.sql

create the user `librarian` because it is not safe to access «mysql root» from
PHP script.

	source $pergamos_dir/sql/user_creation.sql

You can then exit from mysql command-line

	exit



I used, among the others,  the following sources of information. Thanks a lot,
mates!

+ [Official Ubuntu Documentation](https://help.ubuntu.com/)
+ [Mozilla Developer Network](https://developer.mozilla.org/en-US/)
+ «Learning PHP, MySQL, JavaScript, CSS & HTML5», 3rd edition,  by Robin Nixon
+ 

