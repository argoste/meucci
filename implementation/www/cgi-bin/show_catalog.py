#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import web
import database
web.page_title = "Complete catalog"

sql_code = '''
    SELECT
        m.id,
        m.title,
        string_agg(DISTINCT a.authorname, ', '),
        count(DISTINCT p.id) AS number_of_copies,
        array_agg(DISTINCT p.id)
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
    '<th>number of copies</th>',
    '<th>copies id</th>',
    '</tr>'
]
for row in result:
    foo.append('<tr>')
    for field in row:
        foo.extend(['<td>', str(object=field), '</td>'])
    foo.append("</tr>")
foo.append("</table>")

web.main_content = '\n'.join(foo)
web.web_page()
