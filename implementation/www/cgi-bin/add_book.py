#!/usr/bin/env python3
import web
import database
# First part of the page
web.page_title = "Add a new book"
myfile = open(file='form.html', mode='r')
form  = myfile.read()

# get user_input from html form, give feedback, update user_inputbase
user_input = web.cgi.FieldStorage()
message= ''

if "monography_title" not in user_input:
    message= "PLEASE ENTER SOME VALUES"
else:
    for key in ['monography_title', 'copies_quantity']:
        message= message+ user_input.getvalue(key) + '<br>'
    for key in ['author', 'subject']:
        mylist = user_input.getlist(key)
        for element in mylist:
            message= message+ element + '<br>'
    monography_title =  user_input.getvalue('monography_title')
    copies_quantity = int(user_input.getvalue('copies_quantity'))
    author = user_input.getlist('author')
    subject = user_input.getlist('subject')
    database.add_book(monography_title, author, subject, copies_quantity)

monitor = '<div class="monitor">'+ message  + "</div>"
web.main_content = form + monitor
web.web_page()
