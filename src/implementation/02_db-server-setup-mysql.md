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
