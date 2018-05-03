#!/usr/bin/env python3
# This module is to use database in Python scripts

# I don't need the "psycopg" library because I don't use Postgresql
# I neet mysql.connector as explained on MySQL official page
import mysql.connector
# these should be constants, really
HOST = "localhost"
DATABASE = "meucci"
USER = "guest"
PASSWORD = "laboratorio09"

def complete_query(sql_code):
    """Connect to RDBM and execute SQL code
    returns the result as list of tuples"""
    # Create a new database session and return a new connection object.
    conn = mysql.connector.connect(
        host=HOST,
        database=DATABASE,
        user=USER,
        password=PASSWORD
        )
    # open a cursor
    cur = conn.cursor()
    # execute the query
    cur.execute(sql_code)
    # The result, if exists,  is a list of tuples representing the rows
    result = cur.fetchall()
    return result
    # make changes to database persistent
    conn.commit()
    # close cursor and connection
    cur.close()
    conn.close()

def add_book(monography_title, author, subject, copies_quantity):
    """Complete insertion of a new book in all needed tables"""
    # Create a new database session and return a new connection object.
    conn = mysql.connector.connect(
        host=HOST,
        database=DATABASE,
        user=USER,
        password=PASSWORD
    )
    # open a cursor
    cur = conn.cursor()
    #
    #
    # TODO I need IF NOT EXIST OR SOMETHING LIKE that
    # TO MAKE SURE TO NOT INSERT TO TIMES THE SAME monography
    # I CAN ADD A NEW PHYSICALCOPY, THOUGH

    cur.execute("""INSERT INTO monography (title) VALUES (%s);""",
        (monography_title,)
    )
    cur.execute(
        """SELECT id FROM monography WHERE title = %s;""",
        (monography_title,)
    )
    monography_id = cur.fetchone()
    a_copy = 0
    while a_copy < copies_quantity:
        cur.execute(
            """INSERT INTO physicalcopy (monography_id) VALUES (%s);""",
            (monography_id,)
        )
        a_copy = a_copy + 1
    # I need author to be an iterable
    for aut in author:
        cur.execute(
            """INSERT INTO author (authorname) VALUES (%s);""",
            (aut,)
        )
        cur.execute(
            """SELECT id FROM author WHERE authorname = %s;""",
            (aut,)
        )
        author_id = cur.fetchone()
        cur.execute(
            """INSERT INTO monography_author (monography_id, author_id)
            VALUES (%s, %s);""",
            (monography_id, author_id)
        )
    for sub in subject:
        cur.execute(
            """INSERT INTO monography_subject (monography_id, subject_id)
            VALUES (%s, %s)""",
            (monography_id, sub)
        )
    # make changes to database persistent
    conn.commit()
    # close cursor and connection
    cur.close()
    conn.close()
