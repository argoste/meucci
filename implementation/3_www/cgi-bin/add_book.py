#!/usr/bin/env python3
import web
import database
web.page_title = "Add a new book"
myfile = open(file='form.html', mode='r')
form  = myfile.read()
web.main_content = form
web.web_page()
