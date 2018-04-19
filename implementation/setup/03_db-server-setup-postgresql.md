# Initial setup of PostgreSQL

On Linux Opensuse Leap 42.2

I searched with  package manager `postgresql server` and installed relevant packages. it also installs the systemd unit file `postgresql.service` and the text-mode client `psql`.

Start the server with `sudo systemctl start postgresql`.

become unix user `root`
~~~
ste@pegasus: su
~~~
login as unix user `postgres` (note the dash for  login shell), which is the superuser for this DBMS
~~~
root@pegasus: su - postgres
postgres@pegasus:
~~~
use the default client
~~~
postgres@pegasus: psql
~~~

~~~
psql (9.4.9)
Type "help" for help.
~~~
change password
~~~
postgres=# \password postgres
Enter new password:
Enter it again:
~~~
exit to shell
~~~
postgres=# \q
~~~
logout
~~~
postgres@pegasus: exit
~~~
logout
~~~
root@pegasus: exit
ste@pegasus:~
~~~

## Client autentication

A configuration file is `pg_hba.conf`. From the comments:

  This file controls: which hosts are allowed to connect, how clients
  are authenticated, which PostgreSQL user names they can use, which
  databases they can access.

On Suse it seems to be  in  `/var/lib/pgsql/data/pg_hba.conf`. I read somewhere that it is located in the database data folder.

Some resources like examples seem to be located in `/usr/share/postgresql94`.
