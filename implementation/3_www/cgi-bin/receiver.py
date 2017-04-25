#!/usr/bin/env python3
import cgi
import cgitb # to debug TODO remove in production
cgitb.enable(format="text")
import web
web.page_title = "Add a new book"
# get data from html form
user_input = web.cgi.FieldStorage()
message = ''
if "monography_title" not in user_input:
    message = "PLEASE ENTER SOME VALUES"
else:
    for entry in user_input:
        message = message + ' START'+ repr(user_input) + 'END '

web.main_content = '<div class="monitor">'+ message  + "</div>"
web.web_page()
