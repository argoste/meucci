#!/usr/bin/python3
# these should be constants, really
Host = "localhost"
Dbname = "meucci"
User = "ste"
Password = "salame"
# I need the "psycopg" library to use Postgresql
import psycopg2 as pg
# Create a new database session and return a new connection object.
conn = pg.connect(host=Host, dbname=Dbname, user=User, password=Password)
# open a cursor
cur = conn.cursor()
# execute some SQL
Sql = "SELECT * FROM monography;"
cur.execute(Sql)
# feth all the resulting tuples
result = cur.fetchall()
print(result)
# make changes to database persistent
conn.commit()
# close cursor and connection
cur.close()
conn.close()
