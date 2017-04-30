#!/usr/bin/env python3
import web
import database
# First part of the page
web.page_title = "Add a new book"
myfile = open(file='form1.html', mode='r')
form  = myfile.read()

# get user_input from html form, give feedback, update user_inputbase
user_input = web.cgi.FieldStorage()

mylist = []

if "monography_title" not in user_input or 'copies_quantity' not in user_input:
    mylist.append("PLEASE ENTER SOME CORRECT VALUES")
else:
    mylist.extend([
        'monography_title',
        str(type(user_input.getvalue('monography_title')))
        ])
    for key in ['monography_title', 'copies_quantity']:
        mylist.append(user_input.getvalue(key))
    for key in ['author', 'subject']:
        for element in user_input.getlist(key):
            mylist.append(element)
    # put values in the database
    monography_title =  user_input.getvalue('monography_title')
    copies_quantity = int(user_input.getvalue('copies_quantity'))
    author = user_input.getlist('author')
    subject = user_input.getlist('subject')
    database.add_book(monography_title, author, subject, copies_quantity)

monitor = '<div class="monitor">'+ ' '.join(mylist)  + "</div>"
web.main_content = form + monitor
web.web_page()
