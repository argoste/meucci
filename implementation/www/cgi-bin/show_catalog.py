#!/usr/bin/env python3
import web
import database
web.page_title = "Complete catalog"
 # a list of tuples
result = database.show_catalog()
# very important: Python strings are immutable
mystring = """<table>
    <caption>Meucci Catalog</caption>
    <tr>
        <th>monography.id</th>
        <th>monography.title</th>
        <th>physicalcopy.id</th>
    </tr>"""
for row in result:
    mystring = mystring + "<tr>\n"
    for field in row:
        mystring = mystring + "<td>"
        mystring = mystring + str(field)
        mystring = mystring + "</td>\n"
    mystring = mystring + "</tr>\n"
mystring = mystring + "</table>\n"
web.main_content = mystring
web.web_page()
