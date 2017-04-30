#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import web
import database
# BUG If the user enters characters outside ASCII, the RDBMS memorizes them,
# but this script crashes

web.page_title = "Complete catalog"
myfile = open('form2.html')
form = myfile.read()

# TODO make everything modular, avoid repetitions

# to search in the catalog, I just need to add a WHERE statement with
# multiple OR
sql_code = '''
    SELECT
        m.id,
        m.title,
        string_agg(DISTINCT a.authorname, ', '),
        count(p.id) AS number_of_copies
    FROM physicalcopy AS p
    JOIN monography AS m
        ON p.monography_id = m.id
    JOIN monography_author AS ma
        ON m.id = ma.monography_id
    JOIN author AS a
        ON ma.author_id = a.id
    GROUP BY m.id
    ;
'''
result = database.complete_query(sql_code)

foo = [
    "<table>",
    '<caption>Meucci Catalog</caption>',
    '<tr>',
    '<th>monography id</th>',
    '<th>monography title</th>',
    '<th>authors</th>',
    '<th>physicalcopy id</th>',
    '</tr>'
]
for row in result:
    foo.append('<tr>')
    for field in row:
        foo.extend(['<td>', str(field), '</td>'])
    foo.append("</tr>")
foo.append("</table>")

web.main_content = form2 + '\n'.join(foo)
web.web_page()
