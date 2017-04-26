#!/usr/bin/env python3
import web, database
web.page_title = "Add a new book"
# get data from html form
u = web.cgi.FieldStorage()
m = ''
if "monography_title" not in u:
    m = "PLEASE ENTER SOME VALUES"
else:
    for key in ['monography_title', 'copies_quantity']:
        m = m + u.getvalue(key) + '<br>'
    for key in ['author', 'subject']:
        mylist = u.getlist(key)
        for element in mylist:
            m = m + element + '<br>'
    monography_title =  u.getvalue('monography_title')
    copies_quantity = int(u.getvalue('copies_quantity'))
    author = u.getlist('author')
    subject = u.getlist('subject')
    database.add_book(monography_title, author, subject, copies_quantity)


web.main_content = '<div class="monitor">'+ m  + "</div>"
web.web_page()
